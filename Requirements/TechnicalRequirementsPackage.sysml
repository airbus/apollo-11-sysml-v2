//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package TechnicalRequirementsPackage {
	
	private import SI::*;
	private import ISQ::*;
	private import ScalarValues::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import USCustomaryUnits::*;
	private import ModelingMetadata::*;
    private import CoSMAPackage::*;
    private import FunctionalRequirementsPackage::*;

	requirement def <'CLR-R001'> SICEngineConfiguration {
		doc /* The S-IC stage shall incorporate five F-1 engines. */
		@Rationale {
			text = "This configuration is required to generate the necessary thrust to lift the massive Saturn V vehicle off the launch pad.";
		}
		#refinement dependency SICEngineConfiguration to FunctionalRequirementsPackage::'FLR-R008';
	}

	requirement def <'CLR-R002'> SICPropellantCompatibility {
		doc /* The S-IC stage shall be designed to store and deliver RP-1 (Kerosene) and Liquid Oxygen (LOX) to its engines. */
		@Rationale {
			text = "The choice of the F-1 engine dictates the required propellant types for the first stage.";
		}
		#refinement dependency SICPropellantCompatibility to FunctionalRequirementsPackage::'FLR-R001';
	}
	
	requirement def <'CLR-R003'> SICGimbalCapability {
		doc /* The S-IC stage shall provide a gimbaling mechanism for its engines to enable thrust vector control. */
		@Rationale {
			text = "Gimbaling is the primary means of steering the vehicle during the first stage of ascent, as aerodynamic surfaces are ineffective at low speeds.";
		}
		#refinement dependency SICGimbalCapability to FunctionalRequirementsPackage::'FLR-R013';
	}

	requirement def <'CLR-R026'> SICSeparationSystem {
		doc /* The S-IC stage shall incorporate a pyrotechnic separation system to cleanly detach from the S-II stage. */
		@Rationale {
			text = "A reliable separation system is critical to jettison the massive first stage and allow the second stage to ignite without obstruction.";
		}
		#refinement dependency SICSeparationSystem to FunctionalRequirementsPackage::'FLR-R014';
	}


	requirement def <'CLR-R004'> SIIEngineConfiguration {
		doc /* The S-II stage shall incorporate five J-2 engines. */
		@Rationale {
			text = "This configuration provides the required thrust for second-stage flight in the upper atmosphere and vacuum where efficiency is paramount.";
		}
		#refinement dependency SIIEngineConfiguration to FunctionalRequirementsPackage::'FLR-R010';
	}

	requirement def <'CLR-R005'> SIIPropellantType {
		doc /* The S-II stage shall use Liquid Hydrogen (LH2) and Liquid Oxygen (LOX) propellants. */
		@Rationale {
			text = "The high specific impulse of hydrolox propellant is critical for the efficiency of the upper stages to minimize vehicle mass.";
		}
		#refinement dependency SIIPropellantType to FunctionalRequirementsPackage::'FLR-R001';
	}

	requirement def <'CLR-R027'> SIIStructuralIntegrity {
		doc /* The S-II stage shall maintain structural integrity under the loads of its own thrust and the mass of the upper stages. */
		@Rationale {
			text = "The S-II stage structure must not fail under the combined stresses of acceleration and the weight of the fully fueled third stage and spacecraft.";
		}
		#refinement dependency SIIStructuralIntegrity to FunctionalRequirementsPackage::'FLR-R010';
	}
	


	requirement def <'CLR-R006'> SIVBEngineConfiguration {
		doc /* The S-IVB stage shall incorporate a single J-2 engine. */
		@Rationale {
			text = "A single, highly reliable engine provides the required thrust for both Earth orbit insertion and the subsequent Translunar Injection maneuver.";
		}
		#refinement dependency SIVBEngineConfiguration to FunctionalRequirementsPackage::'FLR-R011';
	}

	requirement def <'CLR-R007'> SIVBRestartCapability {
		doc /* The S-IVB's J-2 engine shall be capable of restarting in a zero-gravity environment. */
		@Rationale {
			text = "Engine restart is a critical capability, as the stage must fire once for orbit insertion and again for the TLI burn hours later.";
		}
		#refinement dependency SIVBRestartCapability to FunctionalRequirementsPackage::'FLR-R019';
	}

	requirement def <'CLR-R028'> SIVBAttitudeControlSystem {
		doc /* The S-IVB stage shall incorporate an attitude control system to maintain stable orientation during coast phases. */
		@Rationale {
			text = "The stage must maintain a correct and stable attitude in orbit to ensure proper thermal conditions and alignment for the TLI burn.";
		}
		#refinement dependency SIVBAttitudeControlSystem to FunctionalRequirementsPackage::'FLR-R020';
	}


	requirement def <'CLR-R008'> IUGuidanceComputer {
		doc /* The SaturnVInstrumentUnit shall house the primary guidance and navigation computer for the launch vehicle. */
		@Rationale {
			text = "A dedicated computer is required to process trajectory data and execute the complex ascent flight plan autonomously.";
		}
		#refinement dependency IUGuidanceComputer to FunctionalRequirementsPackage::'FLR-R013';
	}

	requirement def <'CLR-R009'> IUCommandAuthority {
		doc /* The SaturnVInstrumentUnit shall issue all primary commands for engine ignition, cutoff, and stage separation during ascent. */
		@Rationale {
			text = "A single, authoritative control unit is necessary to ensure precise and synchronized execution of mission-critical events.";
		}
		#refinement dependency IUCommandAuthority to FunctionalRequirementsPackage::'FLR-R014';
	}

	requirement def <'CLR-R029'> IUTelemetrySystem {
		doc /* The SaturnVInstrumentUnit shall gather and transmit vehicle health and status data to ground telemetry systems. */
		@Rationale {
			text = "Real-time data on the launch vehicle's performance is critical for ground controllers to monitor the ascent.";
		}
		#refinement dependency IUTelemetrySystem to FunctionalRequirementsPackage::'FLR-R017';
	}

	
	requirement def <'CLR-R010'> LESPropulsionType {
		doc /* The ApolloLaunchEscapeSystem shall utilize a high-thrust solid rocket motor. */
		@Rationale {
			text = "Solid rockets provide the rapid, high-impulse thrust needed to pull the crew capsule away from a failing launch vehicle with minimal delay.";
		}
		#refinement dependency LESPropulsionType to FunctionalRequirementsPackage::'FLR-R016';
	}

	requirement def <'CLR-R011'> LESJettisonCapability {
		doc /* The ApolloLaunchEscapeSystem shall be capable of being safely jettisoned from the spacecraft after the period of maximum atmospheric stress. */
		@Rationale {
			text = "The LES is dead weight after the initial ascent phase and must be discarded to ensure mission efficiency.";
		}
		#refinement dependency LESJettisonCapability to FunctionalRequirementsPackage::'FLR-R016';
	}


	requirement def <'CLR-R012'> CMHabitableVolume {
		doc /* The ApolloCommandModule shall provide a pressurized, habitable volume for a crew of three. */
		@Rationale {
			text = "The Command Module serves as the primary living and working quarters for the crew for the majority of the mission.";
		}
		#refinement dependency CMHabitableVolume to FunctionalRequirementsPackage::'FLR-R004';
	}
	
	requirement def <'CLR-R013'> CMHeatShield {
		doc /* The ApolloCommandModule shall incorporate a heat shield capable of protecting the crew and structure from the heat of atmospheric reentry. */
		@Rationale {
			text = "Protection from the extreme temperatures of reentry is a fundamental requirement for crew survival.";
		}
		#refinement dependency CMHeatShield to FunctionalRequirementsPackage::'FLR-R080';
	}

	requirement def <'CLR-R014'> CMParachuteSystem {
		doc /* The ApolloCommandModule shall house a system of parachutes to decelerate the vehicle for a safe water landing. */
		@Rationale {
			text = "Aerodynamic decelerators are required to reduce the capsule's velocity to survivable limits for splashdown.";
		}
		#refinement dependency CMParachuteSystem to FunctionalRequirementsPackage::'FLR-R081';
	}
	
	requirement def <'CLR-R030'> CMDockingMechanism {
		doc /* The ApolloCommandModule shall incorporate a probe and drogue docking mechanism. */
		@Rationale {
			text = "A reliable and proven docking mechanism is required to physically connect with the Lunar Module in Earth and Lunar orbit.";
		}
		#refinement dependency CMDockingMechanism to FunctionalRequirementsPackage::'FLR-R023';
	}

	requirement def <'CLR-R052'> GNCGuidancePrecision {
		doc /* The Apollo 11 Mission's guidance system shall calculate mid-course correction burns with a delta-V accuracy of +/- 0.1 meters per second,
			ensuring the trajectory remains within mission-defined corridors. */
		@Rationale {
			text = "Precise calc of trajectory adjustments is vital for minimizing fuel consumption and ensuring the spacecraft stays on the optimal path, supporting mission efficiency and success.";
		}

		attribute actualDeltaVcalcAccuracy :> ISQ::speed;
		attribute maxDeltaVcalcAccuracy :> ISQ::speed = 0.1 [m/s];
		attribute trajectoryWithinCorridor: Boolean;

		require constraint {
			(actualDeltaVcalcAccuracy <= maxDeltaVcalcAccuracy) and
			trajectoryWithinCorridor
		}
		#refinement dependency 'CLR-R052' to FunctionalRequirementsPackage::'FLR-R028';
	}		

	requirement def <'CLR-R053'> RCSControlStability {
		doc /* The Apollo 11 Mission's control system shall maintain spacecraft attitude within +/- 0.5 degrees of commanded orientation
			during orbital and coast phases. */
		@Rationale {
			text = "Stable spacecraft attitude is necessary for accurate navigation, efficient engine burns, proper thermal control, and reliable communication, impacting multiple critical mission functions.";
		}

		attribute actualAttitudeDeviation :> ISQ::angularMeasure;
		attribute maxAttitudeDeviation :> ISQ::angularMeasure = 0.5 ['°'];

		require constraint { actualAttitudeDeviation <= maxAttitudeDeviation }
		#refinement dependency 'CLR-R053' to FunctionalRequirementsPackage::'FLR-R096';
	}
	
	requirement def <'CLR-R054'> LMDSRadarPrecision {
		doc /* The Apollo 11 Mission's lunar lander's navigation system shall provide real-time altitude and velocity data
			with an accuracy of +/- 1 meter for altitude and +/- 0.1 meters per second for velocity during the final 50 meters of powered descent. */
		@Rationale {
			text = "High-fidelity real-time navigation data is critical for the lunar lander's autonomous and manual control during the final, most hazardous, phase of descent, ensuring a safe touchdown.";
		}

		attribute actualAltitudeAccuracy :> ISQ::length;
		attribute maxAltitudeAccuracy :> ISQ::length = 1 [m];

		attribute actualVelocityAccuracy :> ISQ::speed;
		attribute maxVelocityAccuracy :> ISQ::speed = 0.1 [m/s];

		require constraint {
			(actualAltitudeAccuracy <= maxAltitudeAccuracy) and
			(actualVelocityAccuracy <= maxVelocityAccuracy)
		}
		#refinement dependency 'CLR-R054' to FunctionalRequirementsPackage::'FLR-R097';
	}		

	requirement def <'CLR-R015'> SMMainPropulsion {
		doc /* The ApolloServiceModule shall provide a restartable main engine for major in-space maneuvers. */
		@Rationale {
			text = "A high-thrust, reliable main engine is required for critical mission events like Lunar Orbit Insertion and Trans-Earth Injection.";
		}
		#refinement dependency SMMainPropulsion to FunctionalRequirementsPackage::'FLR-R024';
	}
	
	requirement def <'CLR-R016'> SMAttitudeControl {
		doc /* The ApolloServiceModule shall provide a reaction control system for attitude control and minor velocity changes. */
		@Rationale {
			text = "The RCS is essential for orienting the spacecraft for thermal control, communications, and main engine burns.";
		}
		#refinement dependency SMAttitudeControl to FunctionalRequirementsPackage::'FLR-R025';
	}
	
	requirement def <'CLR-R017'> SMPowerGeneration {
		doc /* The ApolloServiceModule shall house fuel cells to generate the primary electrical power for the Command/Service Module. */
		@Rationale {
			text = "A continuous and reliable source of electrical power is required to operate all onboard systems, including life support.";
		}
		#refinement dependency SMPowerGeneration to FunctionalRequirementsPackage::'FLR-R030';
	}

	requirement def <'CLR-R031'> SMThermalControlSystem {
		doc /* The ApolloServiceModule shall incorporate radiators to reject waste heat from the spacecraft into space. */
		@Rationale {
			text = "An active thermal control system is necessary to prevent onboard systems and the crew cabin from overheating.";
		}
		#refinement dependency SMThermalControlSystem to FunctionalRequirementsPackage::'FLR-R031';
	}

	requirement def <'CLR-R051'> CabinEnvironmentalControlRequirement {
		doc /* The Apollo 11 Mission's spacecraft environmental control system shall maintain cabin temperature between 20°C and 25°C
			and oxygen partial pressure between 2.5 pounds per square inch and 4.0 pounds per square inch for all 8 days of the mission, for a crew of three. */
		@Rationale {
			text = "Maintaining a stable and safe cabin environment is crucial for astronaut health, comfort, and performance throughout the mission duration, directly supporting the 'Go to Moon' goal and human safety.";
		}

		attribute actualCabinTemperatureMin :> ISQ::thermodynamicTemperature;
		attribute actualCabinTemperatureMax :> ISQ::thermodynamicTemperature;
		attribute minCabinTemperatureReqd :> ISQ::thermodynamicTemperature = 20 ['°C'];
		attribute maxCabinTemperatureReqd :> ISQ::thermodynamicTemperature = 25 ['°C'];

		attribute actualOxygenPressureMin :> ISQ::pressure;
		attribute actualOxygenPressureMax :> ISQ::pressure;
		attribute minOxygenPressureReqd :> ISQ::pressure = 2.5 ['pound-force per square inch (psi)'];
		attribute maxOxygenPressureReqd :> ISQ::pressure = 4.0 ['pound-force per square inch (psi)'];

		attribute missionDuration :> ISQ::time;

		require constraint {
			(actualCabinTemperatureMin >= minCabinTemperatureReqd) and
			(actualCabinTemperatureMax <= maxCabinTemperatureReqd) and
			(actualOxygenPressureMin >= minOxygenPressureReqd) and
			(actualOxygenPressureMax <= maxOxygenPressureReqd)
		}
		#refinement dependency 'CLR-R051' to FunctionalRequirementsPackage::'FLR-R102';
	}			


	requirement def <'CLR-R018'> LMDSThrottleableEngine {
		doc /* The LunarModuleDescentStage shall provide a main engine with a throttleable thrust range. */
		@Rationale {
			text = "A variable thrust is essential for the powered descent, allowing the crew to precisely control the rate of descent for a soft landing.";
		}
		#refinement dependency LMDSThrottleableEngine to FunctionalRequirementsPackage::'FLR-R046';
	}
	
	requirement def <'CLR-R019'> LMDSLandingGear {
		doc /* The LunarModuleDescentStage shall incorporate a landing gear system capable of absorbing the energy of a lunar touchdown. */
		@Rationale {
			text = "The landing gear must prevent structural damage to the lander and protect the crew from the forces of the final landing impact.";
		}
		#refinement dependency LMDSLandingGear to FunctionalRequirementsPackage::'FLR-R002';
	}

	requirement def <'CLR-R032'> LMDSLaunchPlatform {
		doc /* The LunarModuleDescentStage shall provide a stable, structurally sound platform for the ascent stage to launch from. */
		@Rationale {
			text = "The descent stage must serve as a one-time launch pad on the Moon, withstanding the forces of the ascent engine ignition.";
		}
		#refinement dependency LMDSLaunchPlatform to FunctionalRequirementsPackage::'FLR-R065';
	}
	
	requirement def <'CLR-R050'> LMDSVelocityLimits {
		doc /* The LunarModuleDescentStage shall command thrust to ensure that at the moment of footpad touchdown, the vehicle's velocities do not exceed the following limits:
			* Vertical Velocity: <= 3.05 meters per second (10 feet per second)
			* Horizontal Velocity: <= 1.22 meters per second (4 feet per second)
			*/
		@Rationale {
			text = "These limits prevent structural damage to the ascent stage interface or a post-impact tip-over of the LM.";
		}
		#refinement dependency LMDSVelocityLimits to FunctionalRequirementsPackage::'FLR-R082';
	}		

	requirement def <'CLR-R020'> LMASAscentEngine {
		doc /* The LunarModuleAscentStage shall provide a fixed-thrust engine capable of lifting the stage from the lunar surface into orbit. */
		@Rationale {
			text = "A highly reliable, non-throttleable engine provides the simplest and most robust means of achieving lunar orbit for rendezvous.";
		}
		#refinement dependency LMASAscentEngine to FunctionalRequirementsPackage::'FLR-R066';
	}
	
	requirement def <'CLR-R021'> LMASCrewCabin {
		doc /* The LunarModuleAscentStage shall provide a pressurized cabin for a crew of two. */
		@Rationale {
			text = "The ascent stage serves as the flight deck and habitat for the crew during lunar orbit and surface operations.";
		}
		#refinement dependency LMASCrewCabin to FunctionalRequirementsPackage::'FLR-R062';
	}

	requirement def <'CLR-R033'> LMASRendezvousRadar {
		doc /* The LunarModuleAscentStage shall incorporate a radar system to track the Command Module during rendezvous. */
		@Rationale {
			text = "An independent tracking capability is required for the LM to compute its trajectory relative to the CSM for a successful rendezvous.";
		}
		#refinement dependency LMASRendezvousRadar to FunctionalRequirementsPackage::'FLR-R067';
	}

	requirement def <'CLR-R022'> PSAPressureContainment {
		doc /* The PressureSuiteAssembly shall maintain a positive internal pressure environment for the astronaut. */
		@Rationale {
			text = "Maintaining pressure is the most fundamental requirement for keeping an astronaut alive in the vacuum of space.";
		}
		#refinement dependency PSAPressureContainment to FunctionalRequirementsPackage::'FLR-R053';
	}
	
	requirement def <'CLR-R023'> PSAMobility {
		doc /* The PressureSuiteAssembly shall allow sufficient mobility for the crew to perform required EVA tasks. */
		@Rationale {
			text = "The suit must not be so rigid that it prevents the crew from walking, bending, and using tools effectively.";
		}
		#refinement dependency PSAMobility to FunctionalRequirementsPackage::'FLR-R055';
	}

	requirement def <'CLR-R034'> PSAHelmetVisibility {
		doc /* The PressureSuiteAssembly shall provide a helmet with a wide, unobstructed field of view and protective visors. */
		@Rationale {
			text = "Clear and wide visibility is essential for navigation, task performance, and hazard identification on the lunar surface.";
		}
		#refinement dependency PSAHelmetVisibility to FunctionalRequirementsPackage::'FLR-R055';
	}

	requirement def <'CLR-R024'> PLSSOxygenSupply {
		doc /* The PortableLifeSupportSystem shall contain and supply breathable oxygen to the crew member. */
		@Rationale {
			text = "A finite supply of oxygen is required for the duration of the extravehicular activity.";
		}
		#refinement dependency PLSSOxygenSupply to FunctionalRequirementsPackage::'FLR-R054';
	}
	
	requirement def <'CLR-R025'> PLSSContaminantRemoval {
		doc /* The PortableLifeSupportSystem shall remove carbon dioxide and other contaminants from the suit's atmosphere. */
		@Rationale {
			text = "Recirculating the suit's atmosphere requires the continuous removal of harmful metabolic byproducts like CO2.";
		}
		#refinement dependency PLSSContaminantRemoval to FunctionalRequirementsPackage::'FLR-R053';
	}

	requirement def <'CLR-R035'> PLSSCoolingSystem {
		doc /* The PortableLifeSupportSystem shall circulate cooling fluid to regulate astronaut body temperature. */
		@Rationale {
			text = "An active cooling system is required to remove excess body heat and prevent overheating during strenuous activity in the suit.";
		}
		#refinement dependency PLSSCoolingSystem to FunctionalRequirementsPackage::'FLR-R053';
	}

	requirement def <'CLR-R036'> StagingInterfaceLoadTransfer {
		doc /* The StagingInterface shall be capable of transferring all structural loads from the upper stage to the lower stage during powered ascent. */
		@Rationale {
			text = "Failure to transfer loads would result in catastrophic structural failure of the launch vehicle.";
		}
		#refinement dependency StagingInterfaceLoadTransfer to FunctionalRequirementsPackage::'FLR-R008';
	}

	requirement def <'CLR-R037'> StagingInterfaceCleanSeparation {
		doc /* The StagingInterface shall ensure a clean separation with no re-contact between stages upon receiving a valid separation command. */
		@Rationale {
			text = "Re-contact or debris could damage the upper stage engine, preventing ignition and causing mission failure.";
		}
		#refinement dependency StagingInterfaceCleanSeparation to FunctionalRequirementsPackage::'FLR-R014';
	}

	requirement def <'CLR-R038'> GuidanceInterfaceCommandIntegrity {
		doc /* The GuidanceInterface shall transmit control commands with a data integrity of 99.999% or greater. */
		@Rationale {
			text = "Corrupted guidance commands could lead to loss of vehicle control.";
		}
		#refinement dependency GuidanceInterfaceCommandIntegrity to FunctionalRequirementsPackage::'FLR-R013';
	}

	requirement def <'CLR-R039'> GuidanceInterfaceTelemetryLatency {
		doc /* The GuidanceInterface shall provide real-time telemetry from the stage to the controller with a latency of less than 10 milliseconds. */
		@Rationale {
			text = "Low latency is critical for the guidance computer to make timely adjustments to the vehicle's trajectory.";
		}
		#refinement dependency GuidanceInterfaceTelemetryLatency to FunctionalRequirementsPackage::'FLR-R017';
	}

	requirement def <'CLR-R040'> CSMInterfacePowerTransfer {
		doc /* The CSMInterface shall transfer electrical power from the supplier to the consumer with a voltage drop of less than 2%. */
		@Rationale {
			text = "Efficient power transfer is necessary to ensure all Command Module systems are adequately powered.";
		}
		#refinement dependency CSMInterfacePowerTransfer to FunctionalRequirementsPackage::'FLR-R030';
	}

	requirement def <'CLR-R041'> CSMInterfaceLifeSupportIntegrity {
		doc /* The CSMInterface shall transport life support consumables with zero leakage. */
		@Rationale {
			text = "Any leakage of oxygen or water would be a critical, life-threatening failure.";
		}
		#refinement dependency CSMInterfaceLifeSupportIntegrity to FunctionalRequirementsPackage::'FLR-R025';
	}
	
	requirement def <'CLR-R042'> DockingInterfaceStructuralRigidity {
		doc /* The DockingInterface shall form a rigid structural connection capable of withstanding attitude control maneuvers. */
		@Rationale {
			text = "The two docked spacecraft must behave as a single, rigid body to ensure stable flight control.";
		}
		#refinement dependency DockingInterfaceStructuralRigidity to FunctionalRequirementsPackage::'FLR-R023';
	}

	requirement def <'CLR-R043'> DockingInterfacePressurizedSeal {
		doc /* The DockingInterface shall create a pressurized seal between the two vehicle cabins. */
		@Rationale {
			text = "A secure, pressurized tunnel is required to allow for the safe transfer of crew members between vehicles without spacesuits.";
		}
		#refinement dependency DockingInterfacePressurizedSeal to FunctionalRequirementsPackage::'FLR-R071';
	}

	requirement def <'CLR-R044'> LMStagingInterfaceSeparation {
		doc /* The LMStagingInterface shall execute a clean pyrotechnic separation of the Ascent Stage from the Descent Stage. */
		@Rationale {
			text = "A reliable separation is critical for the Ascent Stage to lift off from the lunar surface unimpeded.";
		}
		#refinement dependency LMStagingInterfaceSeparation to FunctionalRequirementsPackage::'FLR-R065';
	}

	requirement def <'CLR-R045'> EVAInterfaceSecureConnection {
		doc /* The EVAInterface shall provide secure, quick-disconnect fittings for all fluid and data connections. */
		@Rationale {
			text = "Connections must be reliable and easy for a gloved astronaut to operate, while preventing accidental disconnection during an EVA.";
		}
		#refinement dependency EVAInterfaceSecureConnection to FunctionalRequirementsPackage::'FLR-R053';
	}
	
	requirement def <'CLR-R046'> LVPayloadInterfaceStructural {
		doc /* The interface between the SaturnVInstrumentUnit and the ApolloSpacecraftLMAdapter shall withstand all structural loads during launch and ascent. */
		@Rationale {
			text = "This interface bears the entire mechanical load of the 45-ton Apollo spacecraft stack during its most violent flight phase.";
		}
		#refinement dependency LVPayloadInterfaceStructural to FunctionalRequirementsPackage::'FLR-R008';
	}
	
	requirement def <'CLR-R047'> SLALMDeployment {
		doc /* The ApolloSpacecraftLMAdapter shall deploy the Lunar Module upon command with sufficient force to prevent re-contact. */
		@Rationale {
			text = "A successful and clean deployment of the LM after transposition and docking is critical to beginning the lunar phase of the mission.";
		}
		#refinement dependency SLALMDeployment to FunctionalRequirementsPackage::'FLR-R022';
	}
	
	requirement def <'CLR-R048'> LESInterfaceStructuralIntegrity {
		doc /* The interface between the ApolloCommandModule and the ApolloLaunchEscapeSystem shall maintain structural integrity under all launch and ascent aerodynamic loads. */
		@Rationale {
			text = "A structural failure of this interface could cause the LES to detach prematurely, endangering the crew and the mission.";
		}
		#refinement dependency LESInterfaceStructuralIntegrity to FunctionalRequirementsPackage::'FLR-R016';
	}
	
	requirement def <'CLR-R049'> LESInterfaceCommandReliability {
		doc /* The interface between the ApolloCommandModule and the ApolloLaunchEscapeSystem shall reliably transmit abort and jettison commands to the LES motors. */
		@Rationale {
			text = "The failure to transmit an abort command in an emergency would be catastrophic. The failure to jettison the LES would prevent mission continuation.";
		}
		#refinement dependency LESInterfaceCommandReliability to FunctionalRequirementsPackage::'FLR-R016';
	}	

	requirement def <'CLR-R055'> SICThrustMagnitude {
		doc /* The Apollo 11 Mission's launch vehicle's first stage propulsion shall provide a minimum thrust of 34.5 Meganewtons at liftoff. */
		@Rationale {
			text = "Sufficient thrust from the first stage is fundamental to overcome Earth's gravity and initiate the launch sequence, enabling the entire mission.";
		}

		attribute actualLiftoffThrust :> ISQ::force;
		attribute minLiftoffThrust :> ISQ::force = 34.5 [MN];

		require constraint { actualLiftoffThrust >= minLiftoffThrust }
	
	}

	requirement def <'CLR-R056'> SPSIgnitionReliability {
		doc /* The Apollo 11 Mission's in-space propulsion system shall be capable of performing at least 3 full-duration major burns
			(e.g., Lunar Orbit Insertion, Trans-Earth Injection) with a 99.8% ignition success rate for each burn. */
		@Rationale {
			text = "The reliability of in-space propulsion is paramount for achieving and departing lunar orbit, directly impacting mission success and crew safety; failure means being stranded.";
		}

		attribute actualMajorBurnCount: Integer;
		attribute minMajorBurnCount: Integer = 3;

		attribute actualIgnitionSuccessRate: RatioValue;
		attribute minIgnitionSuccessRate: RatioValue = 99.8['%'];

		require constraint {
			(actualMajorBurnCount >= minMajorBurnCount) and
			(actualIgnitionSuccessRate >= minIgnitionSuccessRate)
		}
		#refinement dependency 'CLR-R056' to FunctionalRequirementsPackage::'FLR-R024';
	}

	requirement def <'CLR-R057'> DPSThrottlingRange {
		doc /* The Apollo 11 Mission's lunar lander's descent propulsion system shall provide throttleable thrust
			from 10% to 100% of maximum thrust to enable precise lunar landing control. */
		@Rationale {
			text = "Throttling capability provides the fine control necessary to manage descent rate and fuel consumption during the lunar landing, crucial for achieving a soft and controlled touchdown.";
		}

		attribute actualMinThrottlePercentage: RatioValue;
		attribute minRequiredThrottlePercentage: RatioValue = 10['%'];

		attribute actualMaxThrottlePercentage: RatioValue;
		attribute maxRequiredThrottlePercentage: RatioValue = 100['%'];

		require constraint {
			(actualMinThrottlePercentage <= minRequiredThrottlePercentage) and
			(actualMaxThrottlePercentage >= maxRequiredThrottlePercentage)
		}
		#refinement dependency 'CLR-R057' to FunctionalRequirementsPackage::'FLR-R099';
	}

	requirement def <'CLR-R058'> LMASBurnDuration {
		doc /* The Apollo 11 Mission's lunar lander's ascent propulsion system shall achieve a burn duration of <= 400 seconds
			to insert the ascent stage into lunar orbit. */
		@Rationale {
			text = "A specific burn duration is required to ensure the ascent stage achieves the correct lunar orbit for rendezvous, directly enabling the crew's return to the Command Module.";
		}

		attribute actualAscentBurnDuration :> ISQ::time;
		attribute maxAscentBurnDuration :> ISQ::time = 400 [s];

		require constraint { actualAscentBurnDuration <= maxAscentBurnDuration }
		#refinement dependency 'CLR-R058' to FunctionalRequirementsPackage::'FLR-R066';
	}

	requirement def <'CLR-R059'> PrimaryStructureLoadLimit {
		doc /* All primary structural elements of the Apollo 11 Mission launch system shall withstand launch loads of up to 4 gees
			without permanent deformation or failure. */
		@Rationale {
			text = "Structural integrity during the high-stress launch phase is absolutely essential to prevent catastrophic failure and ensure the vehicle and crew reach orbit safely.";
		}

		attribute actualMaxLaunchLoadWithstood :> ISQ::acceleration;
		attribute requiredMaxLaunchLoadWithstood :> ISQ::acceleration = 4 [gn];

		attribute permanentDeformationObserved: Boolean;
		attribute structuralFailureObserved: Boolean;

		require constraint {
			(actualMaxLaunchLoadWithstood >= requiredMaxLaunchLoadWithstood) and
			not permanentDeformationObserved and
			not structuralFailureObserved
		}
	}

	requirement def <'CLR-R060'> CMHeatShieldThermalPerf {
		doc /* The Apollo 11 Mission's crew vehicle heat shield shall ablate as designed and limit internal crew compartment
			temperature rise to less than 5°C during atmospheric re-entry. */
		@Rationale {
			text = "The heat shield is critical for crew survival during re-entry by protecting against extreme temperatures, directly addressing human safety.";
		}

		attribute actualInternalTemperatureRise :> ISQ::thermodynamicTemperature;
		attribute maxInternalTemperatureRise :> ISQ::thermodynamicTemperature = 5 ['°C'];

		attribute heatShieldAblationAsDesigned: Boolean;

		require constraint {
			(actualInternalTemperatureRise < maxInternalTemperatureRise) and
			heatShieldAblationAsDesigned
		}
		#refinement dependency 'CLR-R060' to FunctionalRequirementsPackage::'FLR-R100';
	}

	requirement def <'CLR-R061'> PyrotechnicInitiationReliability {
		doc /* All pyrotechnic devices (e.g., stage separation, parachute deployment) used in the Apollo 11 Mission
			shall have a 99.99% initiation reliability. */
		@Rationale {
			text = "Highly reliable pyrotechnic devices are crucial for sequential mission events like stage separations and parachute deployment, as failures in these systems could lead to catastrophic mission loss or crew fatalities.";
		}

		attribute actualInitiationReliability: RatioValue;
		attribute minInitiationReliability: RatioValue = 99.99['%'];

		require constraint { actualInitiationReliability >= minInitiationReliability }
	}

	requirement def <'CLR-R062'> DockingMechanismReliability {
		doc /* The Apollo 11 Mission's spacecraft docking system shall enable two spacecraft to mate and form a rigid connection
			in lunar orbit, capable of withstanding dynamic loads during rendezvous maneuvers,
			with a 99.5% success rate for capture and latching. */
		@Rationale {
			text = "Reliable docking is essential for transferring crew and samples, making it a critical path to crew return and scientific goals. Failure would mean being stranded in lunar orbit.";
		}

		attribute actualCaptureLatchingSuccessRate: RatioValue;
		attribute minCaptureLatchingSuccessRate: RatioValue = 99.5['%'];

		attribute connectionRigidityMaintained: Boolean;
		attribute withstandsDynamicLoads: Boolean;

		require constraint {
			(actualCaptureLatchingSuccessRate >= minCaptureLatchingSuccessRate) and
			connectionRigidityMaintained and
			withstandsDynamicLoads
		}
	}

	requirement def <'CLR-R063'> LMDSLandingGearEnergy {
		doc /* The Apollo 11 Mission's lunar lander's landing gear shall absorb impact energy equivalent to a 3 meters per second vertical velocity
			and 1 meter per second horizontal velocity at touchdown without structural failure. */
		@Rationale {
			text = "The landing gear must reliably absorb the forces of lunar touchdown to protect the lander structure, its internal systems, and the crew.";
		}

		attribute maxImpactVerticalVelocityAbsorbed :> ISQ::speed;
		attribute minImpactVerticalVelocityRequired :> ISQ::speed = 3 [m/s];

		attribute maxImpactHorizontalVelocityAbsorbed :> ISQ::speed;
		attribute minImpactHorizontalVelocityRequired :> ISQ::speed = 1 [m/s];

		attribute structuralFailureOccurred: Boolean;

		require constraint {
			(maxImpactVerticalVelocityAbsorbed >= minImpactVerticalVelocityRequired) and
			(maxImpactHorizontalVelocityAbsorbed >= minImpactHorizontalVelocityRequired) and
			not structuralFailureOccurred
		}
	}

	requirement def <'CLR-R064'> ECSWaterSupplyRate {
		doc /* The Apollo 11 Mission's crew's potable water system shall provide a minimum of 2 kilograms of potable water per crew member per day. */
		@Rationale {
			text = "Adequate potable water is a fundamental requirement for sustaining crew health and life throughout the mission.";
		}

		attribute actualWaterProvidedPerCrewPerDay :> ISQ::mass;
		attribute minWaterRequiredPerCrewPerDay :> ISQ::mass = 2 [kg];

		require constraint { actualWaterProvidedPerCrewPerDay >= minWaterRequiredPerCrewPerDay }
	}

	requirement def <'CLR-R065'> ECSFilterEfficiency {
		doc /* The Apollo 11 Mission's cabin atmosphere purification system shall maintain carbon dioxide levels below 0.5% by volume
			and remove particulate matter >= 0.5 microns with 99% efficiency. */
		@Rationale {
			text = "Maintaining breathable air free of harmful contaminants is a continuous and critical life support function, directly impacting crew health and safety.";
		}

		attribute actualCO2LevelMax: RatioValue;
		attribute maxCO2LevelReqd: RatioValue = 0.5['%'];

		attribute actualParticulateRemovalEfficiency: RatioValue;
		attribute minParticulateRemovalEfficiency: RatioValue = 99['%'];

		require constraint {
			(actualCO2LevelMax <= maxCO2LevelReqd) and
			(actualParticulateRemovalEfficiency >= minParticulateRemovalEfficiency)
		}
	}

		requirement def <'CLR-R066'> DataHandlingIntegrity {
		doc /* The Apollo 11 Mission's data acquisition system shall record and store all critical telemetry data for the entire mission duration,
			with no less than 99.9% data integrity. */
		@Rationale {
			text = "High data integrity ensures that ground control has accurate information for real-time decision-making, post-flight analysis, and mission lessons learned.";
		}

		attribute actualDataIntegrityPercentage: RatioValue;
		attribute minDataIntegrityPercentage: RatioValue = 99.9['%'];

		require constraint { actualDataIntegrityPercentage >= minDataIntegrityPercentage }
	}

	requirement def <'CLR-R067'> CommVideoBandwidth {
		doc /* The Apollo 11 Mission spacecraft shall be capable of transmitting live video from the lunar surface to Earth
			with a resolution of at least 320x240 pixels and a frame rate of >= 10 frames per second. */
		@Rationale {
			text = "Live video transmission from the lunar surface significantly enhances public engagement and inspiration, and provides valuable real-time visual context for mission operations.";
		}

		attribute actualVideoWidth: Integer;
		attribute minVideoWidth: Integer = 320;

		attribute actualVideoHeight: Integer;
		attribute minVideoHeight: Integer = 240;

		attribute actualFrameRate :> ISQ::frequency;
		attribute minFrameRate :> ISQ::frequency = 10 ['fps'];

		require constraint {
			(actualVideoWidth >= minVideoWidth) and
			(actualVideoHeight >= minVideoHeight) and
			(actualFrameRate >= minFrameRate)
		}
		#refinement dependency 'CLR-R067' to FunctionalRequirementsPackage::'FLR-R103';
	}

	requirement def <'CLR-R068'> EMUPressureContainment {
		doc /* The Apollo 11 Mission's Extravehicular Mobility Unit shall maintain internal pressure at 25.5 kilopascals with no more than 5% pressure loss per hour during Extravehicular Activity. */
		@Rationale {
			text = "Maintaining internal pressure in the Extravehicular Mobility Unit is critical for astronaut safety and performance during Extravehicular Activity in the vacuum of space.";
		}

		attribute actualEMUInternalPressure :> ISQ::pressure;
		attribute nominalEMUInternalPressure :> ISQ::pressure = 25.5 ['kPa'];

		attribute actualPressureLossRate: RatioValue;
		attribute maxPressureLossRate: RatioValue = 5['%'];

		require constraint {
			(actualPressureLossRate <= maxPressureLossRate)
		}
		#refinement dependency 'CLR-R068' to FunctionalRequirementsPackage::'FLR-R104';
	}

	requirement def <'CLR-R069'> EASEPOperationalDuration {
		doc /* The Apollo 11 Mission's deployed scientific instruments shall be operational for a minimum of 30 days post-deployment
			and transmit at least 100 Kilobytes of scientific data per day for this period. */
		@Rationale {
			text = "Ensuring long-term operation and sufficient data transmission from deployed instruments maximizes the scientific return and provides continuous monitoring of the lunar environment.";
		}

		attribute actualOperationalDuration :> ISQ::time;
		attribute minOperationalDuration :> ISQ::time = 30['d'];

		attribute actualDailyDataTransmission :> ISQ::storageCapacity;
		attribute minDailyDataTransmission :> ISQ::storageCapacity = 100 ['kB'];

		require constraint {
			(actualOperationalDuration >= minOperationalDuration) and
			(actualDailyDataTransmission >= minDailyDataTransmission)
		}
		#refinement dependency 'CLR-R069' to FunctionalRequirementsPackage::'FLR-R059';
	}

	requirement def <'CLR-R070'> MissionSystemReliability {
		doc /* All mission-critical flight systems of the Apollo 11 Mission (e.g., primary propulsion, life support, main computer)
			shall demonstrate a statistical reliability of >= 0.999 (three nines) for their operational lifetimes. */
		@Rationale {
			text = "Extremely high reliability for critical systems is foundational to ensuring mission success and astronaut safety, given the inherent risks and remote operating environment.";
		}

		attribute actualSystemReliability: Real;
		attribute minRequiredReliability: Real = 0.999;

		require constraint { actualSystemReliability >= minRequiredReliability }
	}

	requirement def <'CLR-R071'> FlightSoftwareDefectRate {
		doc /* The Apollo 11 Mission's flight software for primary guidance and control shall have zero critical defects (Severity 1 or 2)
			identified during a minimum of 2,000 hours of integrated hardware-in-the-loop simulation prior to flight. */
		@Rationale {
			text = "Zero critical software defects are essential for autonomous and commanded operations, as software failures could directly jeopardize mission success and crew safety.";
		}

		attribute actualCriticalDefectsCount: Integer;
		attribute maxCriticalDefectsAllowed: Integer = 0;

		attribute actualSimulationHours :> ISQ::time;
		attribute minSimulationHoursRequired :> ISQ::time = 2000 [h];

		require constraint {
			(actualCriticalDefectsCount <= maxCriticalDefectsAllowed) and
			(actualSimulationHours >= minSimulationHoursRequired)
		}
		#refinement dependency 'CLR-R071' to FunctionalRequirementsPackage::'FLR-R105';
	}

	requirement def <'CLR-R072'> ComponentAcceptanceRate {
		doc /* All flight components of the Apollo 11 Mission shall undergo acceptance testing to verify conformance to specifications
			before integration, with <= 0.1% non-conformance rate. */
		@Rationale {
			text = "Rigorous acceptance testing ensures that only compliant and reliable components are integrated into the flight system, minimizing risks from faulty parts.";
		}

		attribute actualNonConformanceRate: RatioValue;
		attribute maxNonConformanceRate: RatioValue = 0.1['%'];

		require constraint { actualNonConformanceRate <= maxNonConformanceRate }
	}			
	
	requirement def <'CLR-R073'> MaterialVacuumResistance {
		doc /* All spacecraft materials of the Apollo 11 Mission shall withstand long-term exposure to the space environment
			(vacuum, radiation, thermal cycling) for up to 14 days without critical degradation of structural integrity
			or functional performance. */
		@Rationale {
			text = "Material robustness in the extreme space environment is fundamental to ensuring the long-term integrity and functionality of the spacecraft, directly impacting mission safety and success.";
		}

		attribute actualDegradationLevel: RatioValue; // e.g., % loss of strength/performance (0-100)
		attribute maxDegradationLevel: RatioValue = 0['%']; // 'without critical degradation'

		attribute actualExposureDuration :> ISQ::time;
		attribute minExposureDurationReqd :> ISQ::time = 14 [d];

		require constraint {
			(actualDegradationLevel <= maxDegradationLevel) and
			(actualExposureDuration >= minExposureDurationReqd)
		}
		#refinement dependency 'CLR-R073' to FunctionalRequirementsPackage::'FLR-R106';
	}

	requirement def <'CLR-R074'> ElectronicEMIImmunity {
		doc /* The entire Apollo 11 Mission system shall be designed to withstand the electromagnetic interference (EMI) environment
			of launch and space operations without functional degradation. */
		@Rationale {
			text = "Immunity to electromagnetic interference ensures that all electronic systems operate reliably without disruption from internal or external electromagnetic noise, vital for mission control and safety.";
		}

		attribute functionalDegradationFromEMI: Boolean;

		require constraint { not functionalDegradationFromEMI }
	}	

	requirement def <'CLR-R075'> ImageResolutionStandard {
		doc /* The visual data capture system shall provide a minimum resolution of 2k for still images 
			and 16mm equivalent for motion film. */
		@Rationale {
			text = "High-resolution imagery is necessary to meet scientific documentation and public prestige goals.";
		}
		#refinement dependency 'CLR-R075' to FunctionalRequirementsPackage::'FLR-R107';
	}

	requirement def <'CLR-R076'> WasteStorageVolume {
		doc /* The waste containment system shall provide a minimum of 0.5 cubic feet of sealed storage 
			per crew member for an 8-day mission. */
		@Rationale {
			text = "Prevents cabin contamination and maintains crew hygiene during flight.";
		}
		#refinement dependency 'CLR-R076' to FunctionalRequirementsPackage::'FLR-R108';
	}

	requirement def <'CLR-R077'> VHFAudioBandwidth {
		doc /* The cross-vehicle audio link shall operate within the 250-300 MHz range with a signal-to-noise 
			ratio of at least 20dB. */
		@Rationale {
			text = "Ensures clear voice coordination between the LM and CSM during critical lunar operations.";
		}
		#refinement dependency 'CLR-R077' to FunctionalRequirementsPackage::'FLR-R109';
	}

	requirement def <'CLR-R078'> SystemRedundancyMapping {
		doc /* All Level-1 critical electronic components shall be duplicated in an 'A' and 'B' bus 
			configuration with automatic failover. */
		@Rationale {
			text = "Implements the fault tolerance required to prevent mission loss from a single component failure.";
		}
		#refinement dependency 'CLR-R078' to FunctionalRequirementsPackage::'FLR-R110';
	}

	requirement def <'CLR-R079'> MedicalKitSpecification {
		doc /* The onboard medical kit shall contain antibiotics, analgesics, and minor surgical tools 
			certified for use in zero-gravity. */
		@Rationale {
			text = "Enables the crew to manage health incidents without immediate Earth-based assistance.";
		}
		#refinement dependency 'CLR-R079' to FunctionalRequirementsPackage::'FLR-R111';
	}

	requirement def <'CLR-R080'> GroundArchivalProtocol {
		doc /* Mission telemetry shall be recorded on magnetic tape at three geographically distinct 
			sites with 99.9% data parity. */
		@Rationale {
			text = "Ensures long-term preservation of mission data for future scientific analysis.";
		}
		#refinement dependency 'CLR-R080' to FunctionalRequirementsPackage::'FLR-R112';
	}	

	requirement def <'CLR-R081'> CrewSeatLoadFactor {
            doc /* The crew seating system shall attenuate peak launch acceleration to ensure loads 
                   experienced by the crew do not exceed 6g. */
            @Rationale {
                text = "Ensures crew safety during the high-stress launch phase.";
            }
            #refinement dependency 'CLR-R081' to FunctionalRequirementsPackage::'FLR-R003';
        }

	requirement def <'CLR-R082'> LaunchAbortThresholds {
		doc /* The Instrument Unit shall trigger an automatic abort if the vehicle attitude deviation 
				exceeds 5 degrees or if tank pressure drops below 90% of nominal. */
		@Rationale {
			text = "Ensures a safe abort sequence if critical limits are violated.";
		}
		#refinement dependency 'CLR-R082' to FunctionalRequirementsPackage::'FLR-R006';
	}

	requirement def <'CLR-R083'> SeparationTimerPrecision {
		doc /* Pyrotechnic separation events shall be triggered within 50 milliseconds of the 
				command issue to prevent re-contact. */
		@Rationale {
			text = "Ensures clean separation of stages and modules.";
		}
		#refinement dependency 'CLR-R083' to FunctionalRequirementsPackage::'FLR-R014';
	}	

	requirement def <'CLR-R084'> CabinPressureHold {
		doc /* The crew cabin shall maintain a pressure leak rate of less than 0.1 psi per hour at a nominal pressure of 5.0 psi. */
		@Rationale {
			text = "Defines the boundary for cabin integrity for crew survival in vacuum.";
		}
		#refinement dependency 'CLR-R084' to FunctionalRequirementsPackage::'FLR-R004';
	}

	requirement def <'CLR-R085'> TimingSynchError {
		doc /* The master mission clock system shall maintain synchronization across all segments with a drift of less than 1ms per 24 hours. */
		@Rationale {
			text = "Precise timing is required to synchronize thousands of events across ground and flight segments.";
		}
		#refinement dependency 'CLR-R085' to FunctionalRequirementsPackage::'FLR-R005';
	}

	requirement def <'CLR-R086'> EngineStartLatency {
		doc /* The S-IC engine ignition sequence shall complete within 150ms of the authenticated launch command. */
		@Rationale {
			text = "Timely ignition is critical to meet the planetary launch window and intended trajectory.";
		}
		#refinement dependency 'CLR-R086' to FunctionalRequirementsPackage::'FLR-R007';
	}

	requirement def <'CLR-R087'> StagingShockLimit {
		doc /* Separation pyrotechnics shall not exceed a peak shock load of 50g on adjacent structural interfaces. */
		@Rationale {
			text = "Limits mechanical stress on the second stage to prevent damage during first-stage jettison.";
		}
		#refinement dependency 'CLR-R087' to FunctionalRequirementsPackage::'FLR-R009';
	}

	requirement def <'CLR-R088'> CutoffDeltaVError {
		doc /* Residual thrust from the S-IVB engine post-cutoff shall not exceed 0.05 m/s. */
		@Rationale {
			text = "Precise termination of thrust is necessary to achieve stable Earth orbit insertion.";
		}
		#refinement dependency 'CLR-R088' to FunctionalRequirementsPackage::'FLR-R012';
	}

	requirement def <'CLR-R089'> CockpitDisplayRefresh {
		doc /* Mission-critical flight displays in the CM cockpit shall have a minimum data refresh rate of 2 Hz. */
		@Rationale {
			text = "Provides the crew with real-time situational awareness for manual intervention or aborts.";
		}
		#refinement dependency 'CLR-R089' to FunctionalRequirementsPackage::'FLR-R015';
	}

	requirement def <'CLR-R090'> TelemetrySamplingRate {
		doc /* High-rate telemetry channels for engine health shall be sampled at a minimum of 100 samples per second. */
		@Rationale {
			text = "High-fidelity data is needed for ground-based automated verification of propulsion health.";
		}
		#refinement dependency 'CLR-R090' to FunctionalRequirementsPackage::'FLR-R018';
	}

	requirement def <'CLR-R091'> PostTliSeparationVelocity {
		doc /* The S-IVB auxiliary propulsion system shall provide a minimum delta-V of 1.0 m/s for post-TLI separation. */
		@Rationale {
			text = "Ensures the spent third stage moves away from the spacecraft to prevent re-contact.";
		}
		#refinement dependency 'CLR-R091' to FunctionalRequirementsPackage::'FLR-R019';
	}

	requirement def <'CLR-R092'> SlaSeparationVelocity {
		doc /* The SLA separation springs shall provide a minimum separation velocity of 0.3 meters per second. */
		@Rationale {
			text = "Mechanical force is required to move the spacecraft away from the adapter for transposition.";
		}
		#refinement dependency 'CLR-R092' to FunctionalRequirementsPackage::'FLR-R021';
	}

	requirement def <'CLR-R093'> TranspositionManeuverRate {
		doc /* The RCS shall provide a minimum angular acceleration of 2.0 deg/sec² for transposition maneuvers. */
		@Rationale {
			text = "Defines the control authority needed to rotate the CM 180 degrees for docking.";
		}
		#refinement dependency 'CLR-R093' to FunctionalRequirementsPackage::'FLR-R022';
	}

	requirement def <'CLR-R094'> SextantAngularAccuracy {
		doc /* The onboard sextant shall provide an angular measurement accuracy of +/- 10 arcseconds. */
		@Rationale {
			text = "Required for precise celestial navigation fixes to update the state vector.";
		}
		#refinement dependency 'CLR-R094' to FunctionalRequirementsPackage::'FLR-R026';
	}

	requirement def <'CLR-R095'> StateVectorIntegrationLatency {
		doc /* The navigation computer shall integrate new tracking data into the state vector within 500ms of receipt. */
		@Rationale {
			text = "Minimizes latency in trajectory models for accurate course correction calculations.";
		}
		#refinement dependency 'CLR-R095' to FunctionalRequirementsPackage::'FLR-R027';
	}

	requirement def <'CLR-R096'> CommandTurnaroundLatency {
		doc /* The MSFN ground stations shall maintain an uplink command turnaround latency of less than 2.0 seconds. */
		@Rationale {
			text = "Fast turnaround is essential for ground controllers to react to time-sensitive anomalies.";
		}
		#refinement dependency 'CLR-R096' to FunctionalRequirementsPackage::'FLR-R033';
	}

	requirement def <'CLR-R097'> GroundStationSensitivity {
		doc /* The Unified S-Band system shall have a minimum receiver sensitivity of -120 dBm. */
		@Rationale {
			text = "Ensures weak signals from lunar distances are accurately tracked.";
		}
		#refinement dependency 'CLR-R097' to FunctionalRequirementsPackage::'FLR-R034';
	}

	requirement def <'CLR-R098'> RelayNetworkBitErrorRate {
		doc /* The ground communication network shall maintain a Bit Error Rate (BER) of less than 10⁻⁶ across all relay sites. */
		@Rationale {
			text = "High signal fidelity ensures voice and telemetry remain intelligible.";
		}
		#refinement dependency 'CLR-R098' to FunctionalRequirementsPackage::'FLR-R035';
	}

	requirement def <'CLR-R099'> TimelineDriftAlert {
		doc /* The mission timeline management software shall trigger an alert if execution drifts more than 5 minutes from plan. */
		@Rationale {
			text = "Maintains operational discipline for synchronized orbital events.";
		}
		#refinement dependency 'CLR-R099' to FunctionalRequirementsPackage::'FLR-R036';
	}

	requirement def <'CLR-R100'> SleepAcousticLimit {
		doc /* Ambient noise levels in the crew sleep area shall be limited to 55 dBA. */
		@Rationale {
			text = "Technical requirement for ensuring restorative crew sleep.";
		}
		#refinement dependency 'CLR-R100' to FunctionalRequirementsPackage::'FLR-R037';
	}

	requirement def <'CLR-R101'> TargetOrbitPerigee {
		doc /* The LOI burn shall target a lunar orbit perigee of 60 +/- 5 nautical miles. */
		@Rationale {
			text = "Achieving specific orbit parameters is critical for landing and rendezvous.";
		}
		#refinement dependency 'CLR-R101' to FunctionalRequirementsPackage::'FLR-R039';
	}

	requirement def <'CLR-R102'> HatchClearanceDimensions {
		doc /* The LM crew transfer hatch shall provide a minimum clear opening of 32 x 32 inches. */
		@Rationale {
			text = "Ensures astronauts in bulky suits can safely move between modules.";
		}
		#refinement dependency 'CLR-R102' to FunctionalRequirementsPackage::'FLR-R042';
	}

	requirement def <'CLR-R103'> LmComputerAlignmentTime {
		doc /* The LM primary guidance computer shall be initialized and aligned within 60 minutes of activation. */
		@Rationale {
			text = "Verifies configuration readiness before undocking.";
		}
		#refinement dependency 'CLR-R103' to FunctionalRequirementsPackage::'FLR-R043';
	}

	requirement def <'CLR-R104'> DockingLatchTorqueThreshold {
		doc /* The LM docking latches shall require a minimum of 300 inch-pounds of torque to achieve a rigid seal. */
		@Rationale {
			text = "Defines the mechanical requirement for securing the interface between vehicles.";
		}
		#refinement dependency 'CLR-R104' to FunctionalRequirementsPackage::'FLR-R044';
	}

	requirement def <'CLR-R105'> UndockingSeparationVelocity {
		doc /* The undocking maneuver shall target a relative separation velocity of 0.1 +/- 0.05 meters per second. */
		@Rationale {
			text = "Prevents re-contact between CSM and LM after separation.";
		}
		#refinement dependency 'CLR-R105' to FunctionalRequirementsPackage::'FLR-R045';
	}

	requirement def <'CLR-R106'> DskyDisplayBrightness {
		doc /* The LM DSKY displays shall be readable under direct sunlight (minimum 500 nits brightness). */
		@Rationale {
			text = "Necessary for reading landing data during the bright lunar day.";
		}
		#refinement dependency 'CLR-R106' to FunctionalRequirementsPackage::'FLR-R047';
	}

	requirement def <'CLR-R107'> LandingRadarLockTime {
		doc /* The landing radar shall achieve frequency lock within 5 seconds of the Radar Enable command. */
		@Rationale {
			text = "Rapid data acquisition is required to update altitude before final descent.";
		}
		#refinement dependency 'CLR-R107' to FunctionalRequirementsPackage::'FLR-R048';
	}

	requirement def <'CLR-R108'> PostLandingSafeTime {
		doc /* The LM post-landing safe sequence shall complete within 60 seconds of touchdown. */
		@Rationale {
			text = "Securing propulsion prevents hazardous pressure build-up on the surface.";
		}
		#refinement dependency 'CLR-R108' to FunctionalRequirementsPackage::'FLR-R051';
	}

	requirement def <'CLR-R109'> LmCabinIntegrityLeakRate {
		doc /* The LM cabin integrity test shall confirm a leak rate of <= 0.05 psi/hour before EVA egress. */
		@Rationale {
			text = "Ensures cabin can be re-pressurized before crew departs.";
		}
		#refinement dependency 'CLR-R109' to FunctionalRequirementsPackage::'FLR-R052';
	}

	requirement def <'CLR-R110'> SymbolicMountRigidity {
		doc /* The flag assembly shall withstand a 10-Newton lateral deployment force without collapsing. */
		@Rationale {
			text = "Quantitative requirement to ensure national symbol remains upright.";
		}
		#refinement dependency 'CLR-R110' to FunctionalRequirementsPackage::'FLR-R056';
	}

	requirement def <'CLR-R111'> SampleToolMechanicalAdvantage {
		doc /* Lunar sample tongs shall provide a minimum 5:1 mechanical leverage for rock collection. */
		@Rationale {
			text = "Compensates for reduced manual dexterity of EVA gloves.";
		}
		#refinement dependency 'CLR-R111' to FunctionalRequirementsPackage::'FLR-R057';
	}

	requirement def <'CLR-R112'> EasepThermalInsulation {
		doc /* EASEP experiment packages shall utilize 20-layer aluminized Mylar for thermal insulation. */
		@Rationale {
			text = "Protects instruments from extreme lunar thermal cycles.";
		}
		#refinement dependency 'CLR-R112' to FunctionalRequirementsPackage::'FLR-R059';
	}

	requirement def <'CLR-R113'> EvaCommunicationRange {
		doc /* Astronaut radio systems shall maintain voice link at a maximum range of 500 meters from the LM. */
		@Rationale {
			text = "Defines the technical boundary for safe astronaut travel on the surface.";
		}
		#refinement dependency 'CLR-R113' to FunctionalRequirementsPackage::'FLR-R061';
	}

	requirement def <'CLR-R114'> SurfaceTimelineSync {
		doc /* Surface operations shall synchronize to UTC time with an accuracy of +/- 0.5 seconds. */
		@Rationale {
			text = "Synchronization is vital for managing the timeline relative to the CSM orbit.";
		}
		#refinement dependency 'CLR-R114' to FunctionalRequirementsPackage::'FLR-R064';
	}

	requirement def <'CLR-R115'> LmAscentDeltaVMinimum {
		doc /* The LM ascent stage shall provide a minimum delta-V of 1,850 m/s to achieve lunar orbit. */
		@Rationale {
			text = "Specifies required propulsive performance to escape Moon gravity.";
		}
		#refinement dependency 'CLR-R115' to FunctionalRequirementsPackage::'FLR-R066';
	}

	requirement def <'CLR-R116'> RendezvousOrbitTarget {
		doc /* The rendezvous radar shall target an orbital node within 5 km of the CSM. */
		@Rationale {
			text = "Approach accuracy ensures vehicles are within terminal docking range.";
		}
		#refinement dependency 'CLR-R116' to FunctionalRequirementsPackage::'FLR-R068';
	}

	requirement def <'CLR-R117'> ReentryFlightPathAngle {
		doc /* The CM reentry flight path angle shall be targeted at -6.5 degrees +/- 0.2 degrees. */
		@Rationale {
			text = "Precise angle manages heating and prevents atmospheric skipping.";
		}
		#refinement dependency 'CLR-R117' to FunctionalRequirementsPackage::'FLR-R079';
	}	
}