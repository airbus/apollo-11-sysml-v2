//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package MissionPackage {

	private import CoSMAPackage::*;
	private import MissionPhasesPackage::*;
	private import CapabilitiesPackage::*;
	private import SystemPackage::*;
	private import AstronautsPackage::*;
	private import FunctionsPackage::*;
	private import ContextPackage::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import SI::*;
	private import ISQ::*;

	part def Apollo11Mission :> MannedSpaceMission {
		doc /* Apollo 11 was a spaceflight conducted from July 16 to 24, 1969, by the United States and launched by NASA. */
		
		comment source /* https://www.nasa.gov/history/apollo-11-mission-overview/ */
		
		part apollo11MissionSystem : Apollo11MissionSystem :> system;
		part apollo11MissionContext : Apollo11MissionContext :> context;
		
		perform action performLunarMission : PerformLunarMission;
		
		individual part commander : 'Neil Armstrong' :> crew;
		individual part commandModulePilot : 'Michael Collins' :> crew;
		individual part lunarModulePilot : 'Buzz Aldrin' :> crew;   
		
		attribute :>> plannedDuration = 195.3 [h];
			doc /* Known mission duration: 8 days, 3 hours, 18 minutes. */

		comment cost /* All costs are estimations and more a best guess */        
		attribute :>> researchAndDevelopmentCost = 5E9 ['$'];
		attribute :>> manufacturingCost = 3E9 ['$'];
		attribute :>> operationsCost = 1E9 ['$'];
		attribute :>> personnelCost = 2E9 ['$'];
		
		requirement goToMoon : Goal {
			doc /* Perform a crewed lunar landing and return to Earth. */
		} :> goals;
		requirement flag : Goal {
			doc /* Put a USA flag on the moon. */
		} :> goals;
		requirement samples : Goal {
			doc /* Gather samples of lunar-surface materials and bring them back to Earth. */
		} :> goals;
		requirement pictures : Goal {
			doc /* Extensively photograph the lunar terrain, the deployed scientific equipment, the LM spacecraft, and each other, both with still and motion picture cameras. */
		} :> goals;
		requirement deploy : Goal {
			doc /* Deployment of a television camera to transmit signals to Earth; and deployment of a solar wind composition experiment, seismic experiment package and a Laser Ranging Retroreflector. */
		} :> goals;

		exhibit state apollo11Phases {

			// Declare the states used in this specific state machine
			state initial : Initial;
			state preparation : PrepareForMissionPhase;
			state launch : LaunchPhase;
			state tli : TransLunarInjectionPhase;
			state tlc : TransLunarCoastPhase;
			state loi : LunarOrbitInsertionPhase;
			state lunarOpsDescentPrep : LunarOrbitOperationsDescentPreparationPhase;
			state poweredDescent : PoweredDescentPhase;
			state lunarSurfaceOps : LunarSurfaceOperationsPhase;
			state lunarAscentRendezvous : LunarAscentRendezvousPhase;
			state tei : TransEarthInjectionPhase;
			state tec : TransEarthCoastPhase;
			state reentryLanding : ReentryLandingPhase;
			state recoveryQuarantine : RecoveryQuarantinePhase;
			state final : MissionComplete;
			
			transition first initial then preparation;
			
			transition first preparation accept PreparationPhaseCompletedNotification then launch {
				doc /* if "all preparations concluded successfully"
					*/
			}


			transition first launch accept LaunchPhaseCompletedNotification then tli {
				doc /* if "Successful insertion into stable Earth parking orbit" and "All spacecraft systems verified 'nominal' or 'go' for TLI" and
					"Astronauts report systems nominal and ready for TLI" and
					"Ground stations confirm accurate tracking and TLI burn parameters"
					*/
			}

			transition first tli accept TransLunarInjectionPhaseCompletedNotification then tlc {
				doc /* if "Successful S-IVB TLI burn" and
					"Mission Control confirms free-return trajectory to Moon" and
					"Successful CSM separation, transposition, docking, and LM extraction" and
					"S-IVB stage successfully targeted for disposal"
					*/
			}

			transition first tlc accept TransLunarCoastPhaseCompletedNotification then loi {
				doc /* if "Spacecraft reaches precise LOI burn point" and
					"All CSM systems (SPS engine) verified 'green' and ready for LOI" and
					"Final navigation updates confirm precise trajectory and burn parameters" and
					"Astronauts completed pre-LOI checklists"
					*/
			}

			transition first loi accept LunarOrbitInsertionPhaseCompletedNotification then lunarOpsDescentPrep {
				doc /* if "Successful LOI burn, achieving stable lunar orbit" and
						"Mission Control confirms planned lunar orbit" and
						"Post-LOI checks confirm no anomalies"
					*/
			}

			transition  first lunarOpsDescentPrep accept LunarOrbitOperationsDescentPreparationPhaseCompletedNotification then poweredDescent {
				doc /* if "Astronauts transferred into LM and systems activated" and
					"LM successfully undocked from CSM (visual integrity confirmed)" and
					"Landing site deemed acceptable by crew and Mission Control" and
					"Final navigation updates confirm precise descent trajectory and targeting" and
					"Mission Control gives final 'GO' for Powered Descent"
					*/
			}

			transition first poweredDescent accept PoweredDescentPhaseCompletedNotification then lunarSurfaceOps {
				doc /* if "LM descent stage makes soft landing ('The Eagle has landed!')" and
					"LM integrity confirmed (upright, stable, systems nominal)" and
					"Astronauts safe, healthy, and ready for surface operations" and
					"Adequate consumables remain for abort or planned ascent" and
					"Crew provides initial observations of landing site"
					*/
			}

			transition first lunarSurfaceOps accept LunarSurfaceOperationsPhaseCompletedNotification then lunarAscentRendezvous {
				doc /* if "All planned EVA activities successfully completed" and
					"Both astronauts safely re-entered LM" and
					"LM cabin successfully repressurized" and
					"All LM ascent stage systems confirmed ready for launch" and
					"Sufficient power and propellant for ascent and rendezvous" and
					"Lunar orbital mechanics align for rendezvous"
					*/
			}

			transition first lunarAscentRendezvous accept LunarAscentRendezvousPhaseCompletedNotification then tei {
				doc /* if "LM ascent stage successfully launched and achieved stable lunar orbit" and
					"LM ascent stage successfully rendezvoused and docked with CSM" and
					"Armstrong, Aldrin, and lunar samples transferred back into CSM" and
					"LM ascent stage successfully undocked and jettisoned" and
					"CSM (with all three astronauts) confirmed ready for TEI burn"
					*/
			}

			transition first tei accept TransEarthInjectionPhaseCompletedNotification then tec {
				doc /* if "Successful TEI burn, achieving trans-Earth trajectory" and
					"Mission Control confirms proper return path to Earth" and
					"SPS engine is permanently shut down"
					*/
			}

			transition first tec accept TransEarthCoastPhaseCompletedNotification then reentryLanding {
				doc /* if "CM positioned correctly for atmospheric re-entry (separated from SM)" and
				"Final navigation updates confirm precise re-entry trajectory and landing zone" and
				"All Command Module re-entry systems verified 'go'" and
				"Recovery forces in position and landing zone clear"
				*/
			}

			transition first reentryLanding accept ReentryLandingPhaseCompletedNotification then recoveryQuarantine {
				doc /* if "CM splashes down safely in targeted recovery area" and
					"Astronauts report safe and healthy in capsule" and
					"CM flotation systems active and stable" and
					"Recovery forces have visually acquired CM"
					*/
			}

			transition first recoveryQuarantine accept RecoveryQuarantinePhaseCompletedNotification then final {
				doc /* if "Astronauts extracted to MQF, CM retrieved" and
					"Lunar samples secured and transferred to MQF" and
					"Preliminary health checks of astronauts nominal" and
					"21-day quarantine period officially begins"
					*/
			}

		} :>> phases;

		part programmaticAndPublicAffairsManagement:ProgrammaticAndPublicAffairsManagement :> requiredCapabilites;
		part heavyLiftLaunch:HeavyLiftLaunch :> requiredCapabilites;
		part multiStagePropulsion:MultiStagePropulsion :> requiredCapabilites;
		part precisionOrbitalMechanics:PrecisionOrbitalMechanics :> requiredCapabilites;
		part atmosphericReentryAndLanding:AtmosphericReentryAndLanding :> requiredCapabilites;
		part deepSpaceHabitationAndLifeSupport:DeepSpaceHabitationAndLifeSupport :> requiredCapabilites;
		part autonomousAndAssistedNavigationGuidanceAndControl:AutonomousAndAssistedNavigationGuidanceAndControl :> requiredCapabilites;
		part inSpacePropulsion:InSpacePropulsion :> requiredCapabilites;
		part powerGenerationAndDistribution:PowerGenerationAndDistribution :> requiredCapabilites;
		part lunarSurfaceLandingAndAscent:LunarSurfaceLandingAndAscent :> requiredCapabilites;
		part globalTrackingAndCommunication:GlobalTrackingAndCommunication :> requiredCapabilites;
		part realtimeMissionControl:RealtimeMissionControl :> requiredCapabilites;
		part contingencyPlanningAndRapidResponse:ContingencyPlanningAndRapidResponse :> requiredCapabilites;
		part crewTrainingAndSimulation:CrewTrainingAndSimulation :> requiredCapabilites;
		part humanPerformanceUnderExtremeStress:HumanPerformanceUnderExtremeStress :> requiredCapabilites;
		part complexSoftwareDevelopment:ComplexSoftwareDevelopment :> requiredCapabilites;
		part complexLogisticsAndIntegration:ComplexLogisticsAndIntegration :> requiredCapabilites;
		part launchOperationsManagement:LaunchOperationsManagement :> requiredCapabilites;
		part adaptabilityAndProblemSolving:AdaptabilityAndProblemSolving :> requiredCapabilites;
		part extravehicularActivitySupport:ExtravehicularActivitySupport :> requiredCapabilites;
		part lunarMobility:LunarMobility :> requiredCapabilites;
		part scientificDataAcquisitionAndSampleReturn:ScientificDataAcquisitionAndSampleReturn :> requiredCapabilites;
		part planetaryProtection:PlanetaryProtection :> requiredCapabilites;
		part robustCommunicationAndTelemetry:RobustCommunicationAndTelemetry :> requiredCapabilites;
		part toolDevelopment:ToolDevelopment :> requiredCapabilites;

		connection : CapabilityToGoalDerivation {
			end capa :>> programmaticAndPublicAffairsManagement;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> heavyLiftLaunch;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> multiStagePropulsion;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> precisionOrbitalMechanics;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> atmosphericReentryAndLanding;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> deepSpaceHabitationAndLifeSupport;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> autonomousAndAssistedNavigationGuidanceAndControl;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> inSpacePropulsion;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> powerGenerationAndDistribution;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> lunarSurfaceLandingAndAscent;
			end goal1 :>> goToMoon;
			end goal2 :>> samples;
			end goal3 :>> deploy;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> globalTrackingAndCommunication;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> realtimeMissionControl;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> contingencyPlanningAndRapidResponse;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> crewTrainingAndSimulation;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> humanPerformanceUnderExtremeStress;
			end goal1 :>> goToMoon;
			end goal2 :>> pictures;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> complexSoftwareDevelopment;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> complexLogisticsAndIntegration;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> launchOperationsManagement;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> adaptabilityAndProblemSolving;
			end goal :>> goToMoon;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> extravehicularActivitySupport;
			end goal1 :>> flag;
			end goal2 :>> samples;
			end goal3 :>> pictures;
			end goal4 :>> deploy;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> lunarMobility;
			end goal :>> flag;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> scientificDataAcquisitionAndSampleReturn;
			end goal1 :>> samples;
			end goal2 :>> pictures;
			end goal3 :>> deploy;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> planetaryProtection;
			end goal :>> samples;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> robustCommunicationAndTelemetry;
			end goal :>> pictures;
		} :> capabilityToGoals;
		connection : CapabilityToGoalDerivation {
			end capa :>> toolDevelopment;
			end goal :>> deploy;
		} :> capabilityToGoals;
	}
}