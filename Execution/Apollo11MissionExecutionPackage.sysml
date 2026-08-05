//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package Apollo11MissionExecutionPackage {
	
	private import SI::*;
	private import ISQ::*;
	private import Time::*;
	private import ScalarValues::*;
	private import MissionPackage::*;
	private import FunctionsPackage::*;
	private import SystemPackage::*;
	private import LogicalComponentsPackage::*;
	private import ContextPackage::*;
	private import OccurrenceFunctions::*;
	private import TechnicalComponentsPackage::*;
	private import AstronautsPackage::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;

	individual part def Apollo11MissionIndividual :> Apollo11Mission {
		attribute crewReturnedSafely : ScalarValues::Boolean;
		attribute softLandingAchieved : ScalarValues::Boolean;
		attribute requiredSamplesReturned : ScalarValues::Boolean;
		attribute instrumentsDeployed : ScalarValues::Boolean;
	}

	individual part apollo11MissionIndividual : Apollo11MissionIndividual {
		doc /* A timeline representing the key events of the actual Apollo 11 mission from July 16, 1969, to July 24, 1969. */

		timeslice crewIngress {
			doc /* The flight crew enters the Command Module 'Columbia'. */
			assert constraint { isDuring(apollo11Phases.preparation) }
			snapshot atIngress {
				doc /* The flight crew begins entering the Command Module 'Columbia'. */
				attribute missionTime :> ISQ::time = -9000 ['s']; 
				snapshot missionSystemAtIngress :> apollo11MissionSystem {
					part :>> spaceSuits[2];
					part :>> spacecraft {
						part :>> csm {
							part :>> commandModule {
								attribute cabinPressure :> ISQ::pressure = 101 ['kPa'];
								attribute oxygenLevel :> ratio = 21['%'];
							}
						}
					}
				}
				snapshot groundSystemAtIngress :> context : Apollo11MissionContext {
					part :>> launchControlCenter {
						perform GroundSupportSystem::performCrewIngress :>> performCrewIngress;
					}	
				}
				snapshot crewAtIngress :> crew {
					attribute location: String = "Ingressing Command Module 'Columbia'";
					attribute status: String = "Performing pre-flight checks";
				}
			}
			snapshot atIngressComplete {
				doc /* Crew is secured and the Command Module hatch is sealed. */
				attribute missionTime :> ISQ::time = -3600 ['s'];
				snapshot missionSystemAtIngressComplete :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> csm {
							part :>> commandModule {
								attribute cabinPressure :> ISQ::pressure = 34 ['kPa'];
								attribute oxygenLevel :> ratio = 100['%'];
							}
						}
					}
				}
			}
		}
		
		then timeslice liftoff {
			doc /* This timeslice covers the ascent through Earth's atmosphere. */
			assert constraint { isDuring(apollo11Phases.launch) }
			snapshot atT0 {
				doc /* State Activation: LaunchPhase begins with liftoff. */
				attribute missionTime :> ISQ::time = 0 [s];
				snapshot missionSystemAtT0 :> apollo11MissionSystem {
					attribute velocity :> ISQ::speed = 0 ['m⋅s⁻¹'];
					part :>> launchVehicle {
						part :>> stage1 {
							attribute thrust :> ISQ::force = 35100 ['kN'];
						}
						perform LaunchSystem::provideStage1Thrust :>> provideStage1Thrust;
						perform LaunchSystem::guideAscentTrajectory :>> guideAscentTrajectory;
					}
					part :>> crew {
						perform Crew::observeAscentDataFromCockpit :>> observeAscentDataFromCockpit;
					}
				}
				snapshot groundSystemAtT0 :> context : Apollo11MissionContext {
					part :>> launchControlCenter {
						perform GroundSupportSystem::analyzeLaunchTelemetryFromGround :>> analyzeLaunchTelemetryFromGround;
					}
				}
			}
			snapshot atSICSeparation {
				doc /* Separation Event: The S-IC first stage separates. */
				attribute missionTime :> ISQ::time = 168 [s];
				snapshot missionSystemAtS1Sep :> apollo11MissionSystem {
					attribute velocity :> ISQ::speed = 2400 ['m⋅s⁻¹'];
					attribute altitude :> ISQ::length = 67 ['km'];
					part :>> launchVehicle {
						perform LaunchSystem::provideStage2Thrust :>> provideStage2Thrust;
					}
				}
			}
			snapshot atSIISeparation {
				doc /* Separation Event: The S-II second stage separates. */
				attribute missionTime :> ISQ::time = 540 [s];
				snapshot missionSystemAtS2Sep :> apollo11MissionSystem {
					attribute velocity :> ISQ::speed = 6800 ['m⋅s⁻¹'];
					attribute altitude :> ISQ::length = 185 ['km'];
					part :>> launchVehicle {
						perform LaunchSystem::provideOrbitInsertionThrust :>> provideOrbitInsertionThrust;
					}
				}
			}
		}

		then timeslice translunarInjection {
			doc /* This timeslice covers the burn to leave Earth orbit. */
			assert constraint { isDuring(apollo11Phases.tli) }
			snapshot atTLI {
				doc /* State Activation: TransLunarInjectionPhase begins with the S-IVB burn. */
				attribute missionTime :> ISQ::time = 10036 [s]; 
				snapshot missionSystemAtTLI :> apollo11MissionSystem {
					part :>> launchVehicle {
						part :>> stage3 {
							attribute engineStatus: String = "Burning";
						}
						perform LaunchSystem::provideTranslunarInjectionThrust :>> provideTranslunarInjectionThrust;
						perform LaunchSystem::controlTranslunarInjectionBurn :>> controlTranslunarInjectionBurn;
					}
				}
			}
			snapshot atTLIComplete {
				doc /* The TLI burn is complete, placing the vehicle on a translunar trajectory. */
				attribute missionTime :> ISQ::time = 10384 [s];
				snapshot missionSystemAtTLIEnd :> apollo11MissionSystem {
					attribute status: String = "Translunar trajectory established";
					attribute velocity :> ISQ::speed = 10840 ['m⋅s⁻¹'];
				}
			}
		}

		then timeslice transpositionAndDocking {
			doc /* This timeslice covers the CSM/LM docking and extraction maneuver. */
			assert constraint { isDuring(apollo11Phases.tli) }
			snapshot atCSMSeparation {
				doc /* Separation Event: The CSM separates from the S-IVB/SLA. */
				attribute missionTime :> ISQ::time = 11400 [s];
				snapshot missionSystemAtCSMSep :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> csm {
							attribute relativeVelocity :> ISQ::speed = 0.5 [m/s];
							attribute status: String = "Separated and maneuvering";
						}
						perform Spacecraft::provideAttitudeControlThrust :>> provideAttitudeControlThrust;
					}
					part :>> crew {
						perform Crew::executeTranspositionManeuver :>> executeTranspositionManeuver;
					}
				}
			}
			snapshot atCSLMDocking {
				doc /* The CSM has turned around and is docking with the LM. */
				attribute missionTime :> ISQ::time = 12000 [s];
				snapshot missionSystemAtDocking :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> csm {
							part :>> commandModule {
								attribute dockingProbeStatus: String = "Capture latches engaged";
							}
						}
						attribute status: String = "Soft docked";
						perform Spacecraft::mechanicallyLatchModules :>> mechanicallyLatchModules;
					}
					part :>> crew {
						perform Crew::connectSpacecraft :>> connectSpacecraft;
					}
				}
			}
			snapshot atExtractionComplete {
				doc /* The docked CSM and LM have been extracted from the S-IVB stage. */
				attribute missionTime :> ISQ::time = 14400 [s];
				snapshot missionSystemAtExtraction :> apollo11MissionSystem {
					part :>> spacecraft {
						attribute status: String = "Docked stack extracted";
					}
				}
			}
		}
		
		then timeslice translunarCoast {
			doc /* This timeslice represents the coast to the Moon. */
			assert constraint { isDuring(apollo11Phases.tlc) }
			snapshot atTLCStart {
				doc /* State Activation: TransLunarCoastPhase begins. */
				attribute missionTime :> ISQ::time = 14401 [s];
				snapshot missionSystemAtTLC :> apollo11MissionSystem {
					part :>> spacecraft {
						attribute status: String = "Passive thermal control (barbecue roll) initiated";
						perform Spacecraft::provideAttitudeControlThrust :>> provideAttitudeControlThrust;
					}
					part :>> crew {
						perform Crew::monitorOnboardSystems :>> monitorOnboardSystems;
					}
				}
			}
		}

		then timeslice lunarOrbitInsertion {
			doc /* This timeslice covers the maneuver to enter lunar orbit. */
			assert constraint { isDuring(apollo11Phases.loi) }
			snapshot atLOI {
				doc /* State Activation: LunarOrbitInsertionPhase begins with the LOI burn. */
				attribute missionTime :> ISQ::time = 273110 [s]; 
				snapshot missionSystemAtLOI :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> csm {
							part :>> serviceModule {
								attribute engineStatus: String = "Burning (SPS)";
								attribute fuelRemaining :> ISQ::mass = 18400 [kg];
							}
						}
						perform Spacecraft::provideLunarOrbitInsertionThrust :>> provideLunarOrbitInsertionThrust;
						perform Spacecraft::controlLunarOrbitInsertionBurn :>> controlLunarOrbitInsertionBurn;
					}
				}
			}
			snapshot atLOIComplete {
				doc /* The LOI burn is complete and the spacecraft is in a stable orbit. */
				attribute missionTime :> ISQ::time = 273470 [s];
				snapshot missionSystemAtLOIEnd :> apollo11MissionSystem {
					attribute status: String = "In stable elliptical lunar orbit";
					attribute orbitalParameters: String = "113km x 314km";
				}
			}
		}

		then timeslice descentPreparation {
			doc /* This timeslice covers checking out and undocking the LM. */
			assert constraint { isDuring(apollo11Phases.lunarOpsDescentPrep) }
			snapshot atDescentPrep {
				doc /* State Activation: LunarOrbitOperationsDescentPreparationPhase begins. */
				attribute missionTime :> ISQ::time = 352800 [s];
				snapshot missionSystemAtDescentPrep :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> lm {
							attribute powerStatus: String = "Activated on internal batteries";
						}
					}
					part :>> crew {
						perform Crew::performOrbitalSystemCheckouts :>> performOrbitalSystemCheckouts;
						perform Crew::prepareLanderForSeparation :>> prepareLanderForSeparation;
					}
				}
			}
			snapshot atLMUndocking {
				doc /* Separation Event: The LM undocks from the CSM. */
				attribute missionTime :> ISQ::time = 353100 [s]; 
				snapshot missionSystemAtUndocking :> apollo11MissionSystem {
					part :>> spacecraft {
						perform Spacecraft::separateLanderFromOrbiter :>> separateLanderFromOrbiter;
					}
				}
			}
		}

		then timeslice poweredDescent {
			doc /* This timeslice covers the powered descent to the lunar surface. */
			assert constraint { isDuring(apollo11Phases.poweredDescent) }
			snapshot atPDI {
				doc /* State Activation: PoweredDescentPhase begins with Powered Descent Initiation. */
				attribute missionTime :> ISQ::time = 360205 [s];
				snapshot missionSystemAtPDI :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> lm {
							part :>> lunarModuleDescentStage {
								attribute engineStatus: String = "Burning";
								attribute throttleLevel :> ratio = 90['%'];
							}
						}
						perform Spacecraft::executeDescentBurn :>> executeDescentBurn;
					}
				}
			}
			snapshot atLanding {
				doc /* The Lunar Module 'Eagle' touches down in the Sea of Tranquility. */
				attribute missionTime :> ISQ::time = 360940 [s]; 
				snapshot missionSystemAtLanding :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> lm {
							part :>> lunarModuleDescentStage {
								attribute engineStatus: String = "Shutdown";
								attribute propellantRemaining :> ISQ::mass = 45 [kg];
							}
						}
					}
					part :>> crew {
						perform Crew::manuallyPilotLander :>> manuallyPilotLander;
						perform Crew::performPostLandingCheck :>> performPostLandingCheck;
					}
				}
			}
			
			attribute :>> softLandingAchieved = true;
		}

		then timeslice lunarSurfaceOps {
			doc /* This timeslice covers the activities on the lunar surface. */
			assert constraint { isDuring(apollo11Phases.lunarSurfaceOps) }
			snapshot atEVAStart {
				doc /* State Activation: LunarSurfaceOperationsPhase begins with the first EVA. */
				attribute missionTime :> ISQ::time = 384300 [s]; 
				snapshot missionSystemAtEVAStart :> apollo11MissionSystem {
					part :>> spaceSuits[0] {
						attribute oxygenRemaining :> ISQ::duration = 6.5 ['h'];
						attribute status: String = "Nominal";
						perform EVASystem::provideIndividualLifesupport :>> provideIndividualLifesupport;
					}
					part :>> crew {
						part :>> commander {
							perform Crew::conductSurfaceExploration :>> conductSurfaceExploration;
							perform Crew::gatherLunarSamples :>> gatherLunarSamples;
							perform Crew::deploySurfaceExperiments :>> deploySurfaceExperiments;
						}
					}
				}
			}
			
			attribute :>> instrumentsDeployed = true;
			
			snapshot atEVAEnd {
				doc /* The EVA is complete and the crew are back inside the LM. */
				attribute missionTime :> ISQ::time = 393300 [s];
				snapshot missionSystemAtEVAEnd :> apollo11MissionSystem {
					part :>> spaceSuits[2];
					part :>> spacecraft {
						part :>> lm {
							attribute samplesStowed: Boolean = true;
							attribute cabinPressure :> ISQ::pressure = 34 ['kPa'];
						}
					}
					part :>> crew {
						perform Crew::completeExtravehicularActivity :>> completeExtravehicularActivity;
					}
				}
			}
		}

		then timeslice ascentAndRendezvous {
			doc /* This timeslice covers returning to lunar orbit and docking with the CSM. */
			assert constraint { isDuring(apollo11Phases.lunarAscentRendezvous) }
			snapshot atLunarLiftoff {
				doc /* State Activation: LunarAscentRendezvousPhase begins with liftoff from the Moon. */
				attribute missionTime :> ISQ::time = 447721 [s]; 
				snapshot missionSystemAtLunarLiftoff :> apollo11MissionSystem {
					part :>> spacecraft {
						perform Spacecraft::executeAscentBurn :>> executeAscentBurn;
					}
				}
			}
			snapshot atLunarDocking {
				doc /* The LM Ascent Stage has completed rendezvous and docks with the CSM. */
				attribute missionTime :> ISQ::time = 460200 [s];
				snapshot missionSystemAtDocking :> apollo11MissionSystem {
					attribute status: String = "Docked in lunar orbit, preparing for crew transfer";
					part :>> crew {
						perform Crew::connectSpacecraft :>> connectSpacecraft;
						perform Crew::transferCrewAndMaterials :>> transferCrewAndMaterials;
					}
				}
			}
		}

		then timeslice transearthInjection {
			doc /* This timeslice covers the burn to leave lunar orbit. */
			assert constraint { isDuring(apollo11Phases.tei) }
			snapshot atTEI {
				doc /* State Activation: TransEarthInjectionPhase begins with the TEI burn. */
				attribute missionTime :> ISQ::time = 478500 [s]; 
				snapshot missionSystemAtTEI :> apollo11MissionSystem {
					part :>> spacecraft {
						perform Spacecraft::executeTransearthBurn :>> executeTransearthBurn;
					}
				}
			}
		}
		
		then timeslice transearthCoast {
			doc /* This timeslice represents the coast back to Earth. */
			assert constraint { isDuring(apollo11Phases.tec) }
			snapshot atTECStart {
				doc /* State Activation: TransEarthCoastPhase begins. */
				attribute missionTime :> ISQ::time = 478651 [s];
				snapshot missionSystemAtTEC :> apollo11MissionSystem {
					part :>> spacecraft {
						attribute status: String = "Passive thermal control (barbecue roll) initiated";
					}
				}
			}
		}

		then timeslice reentryAndLanding {
			doc /* This timeslice covers the atmospheric entry and splashdown. */
			assert constraint { isDuring(apollo11Phases.reentryLanding) }
			snapshot atCMSMSeparation {
				doc /* Separation Event: The Command Module separates from the Service Module. */
				attribute missionTime :> ISQ::time = 688200 [s];
				snapshot missionSystemAtCMSMSep :> apollo11MissionSystem {
					part :>> spacecraft {
						perform Spacecraft::separateReturnCapsule :>> separateReturnCapsule;
					}
				}
			}
			snapshot atReentry {
				doc /* State Activation: ReentryLandingPhase begins as the CM hits the atmosphere. */
				attribute missionTime :> ISQ::time = 689100 [s]; 
				snapshot missionSystemAtReentry :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> csm {
							part :>> commandModule {
								attribute heatshieldTemp :> ISQ::thermodynamicTemperature = 2760 ['K'];
								attribute gForce :> ISQ::acceleration = 6.5 [gn];
							}
						}
						perform Spacecraft::guideAtmosphericEntry :>> guideAtmosphericEntry;
					}
				}
			}
			snapshot atSplashdown {
				doc /* The Command Module 'Columbia' splashes down in the Pacific Ocean. */
				attribute missionTime :> ISQ::time = 690395 [s]; 
				snapshot missionSystemAtSplashdown :> apollo11MissionSystem {
					part :>> spacecraft {
						perform Spacecraft::deployDecelerators :>> deployDecelerators;
						perform Spacecraft::performSplashdown :>> performSplashdown;
					}
				}
			}
		}
		
		then timeslice recoveryAndQuarantine {
			doc /* This timeslice covers the recovery of the crew. */
			assert constraint { isDuring(apollo11Phases.recoveryQuarantine) }
			snapshot atRecovery {
				doc /* State Activation: RecoveryQuarantinePhase begins with crew retrieval. */
				attribute missionTime :> ISQ::time = 693000 [s]; 
				snapshot groundSystemAtRecovery :> context : Apollo11MissionContext {
					part :>> recoveryForces {
						perform GroundSupportSystem::retrieveVehicleAndCrew :>> retrieveVehicleAndCrew;
						perform GroundSupportSystem::executeQuarantine :>> executeQuarantine;
					}
				}
			}
			snapshot atRecoveryComplete {
				doc /* The Command Module is hoisted aboard the recovery ship. */
				attribute missionTime :> ISQ::time = 694800 [s];
				snapshot missionSystemAtRecEnd :> apollo11MissionSystem {
					part :>> spacecraft {
						part :>> csm {
							part :>> commandModule {
								attribute status: String = "Secured on deck of USS Hornet";
							}
						}
					}
				}
			}
			
			attribute :>> crewReturnedSafely = true;
			attribute :>> requiredSamplesReturned = true;
		}
	}
}