//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package FunctionalRequirementsPackage {
    
	private import SI::*;
	private import ISQ::*;
	private import ScalarValues::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import USCustomaryUnits::*;
	private import ModelingMetadata::*;
    private import CoSMAPackage::*;
    private import MissionRequirementsPackage::*;

	requirement def <'FLR-R001'> PropellantLoadingRequirement {
		doc /* The system shall enable the loading of all required propellants and consumables into the vehicle's storage systems. */
		@Rationale {
			text = "All propulsive stages and life support systems must be fully supplied to perform their functions for the mission's duration.";
		}
		#refinement dependency 'FLR-R001' to MissionRequirementsPackage::'HLR-R001';
	}

	requirement def <'FLR-R002'> ConsumableConditioningRequirement {
		doc /* The system shall maintain all loaded propellants and consumables at their required temperature and pressure prior to launch. */
		@Rationale {
			 text = "Cryogenic propellants and other consumables must be kept in a stable state to ensure vehicle integrity and readiness for engine start.";
		}
		#refinement dependency 'FLR-R002' to MissionRequirementsPackage::'HLR-R005';
	}

	requirement def <'FLR-R003'> CrewIngressRequirement {
		doc /* The system shall provide a safe method for the flight crew to enter and be secured within the crew cabin. */
		@Rationale {
			 text = "The crew must be safely positioned and secured within the vehicle to withstand the forces of launch.";
		}
		#refinement dependency CrewIngressRequirement to MissionRequirementsPackage::'HLR-R001';
	}

	requirement def <'FLR-R004'> CabinPressurizationRequirement {
		doc /* The system shall verify the pressure integrity of the crew cabin after crew ingress. */
		@Rationale {
			 text = "A sealed cabin is fundamental for providing a habitable, life-sustaining environment for the crew.";
		}
		#refinement dependency CabinPressurizationRequirement to MissionRequirementsPackage::'HLR-R005';
	}

	requirement def <'FLR-R005'> CountdownSequencingRequirement {
		doc /* The system shall execute a synchronized sequence of pre-launch checks and configurations. */
		@Rationale {
			 text = "A precisely timed sequence is necessary to ensure thousands of vehicle and ground systems are correctly configured for launch.";
		}
		#refinement dependency 'FLR-R005' to MissionRequirementsPackage::'HLR-R068';
	}

	requirement def <'FLR-R006'> CountdownAbortRequirement {
		doc /* The system shall be capable of holding or aborting the countdown if any critical system parameter violates pre-defined limits. */
		@Rationale {
			 text = "This capability is a critical safety function to prevent launching a vehicle that is not in a nominal state.";
		}
		#refinement dependency CountdownAbortRequirement to MissionRequirementsPackage::'HLR-R046';
	}

	requirement def <'FLR-R007'> Stage1ThrustInitiationRequirement {
		doc /* The system shall initiate first stage main propulsion upon receiving a valid, authenticated launch command. */
		@Rationale {
			 text = "Reliable and timely initiation of ascent thrust is critical for leaving the launch pad and beginning the flight profile as planned.";
		}
		#refinement dependency 'FLR-R007' to MissionRequirementsPackage::'HLR-R062';
	}

	requirement def <'FLR-R008'> Stage1ThrustMagnitudeRequirement {
		doc /* The system shall generate a propulsive force from the first stage that results in a positive vertical acceleration at liftoff. */
		@Rationale {
			 text = "A thrust-to-weight ratio greater than one is the fundamental condition required to overcome gravity and lift the vehicle off the launch pad.";
		}
		#refinement dependency 'FLR-R008' to MissionRequirementsPackage::'HLR-R062';
	}

	requirement def <'FLR-R009'> Stage2ThrustInitiationRequirement {
		doc /* The system shall initiate second stage propulsion following the clean separation of the first stage. */
		@Rationale {
			 text = "Continuous acceleration is required to achieve the velocity needed to reach the upper atmosphere.";
		}
		#refinement dependency 'FLR-R009' to MissionRequirementsPackage::'HLR-R062';
	}

	requirement def <'FLR-R010'> Stage2PropulsionRequirement {
		doc /* The system shall provide continuous thrust from the second stage to propel the vehicle through the upper atmosphere. */
		@Rationale {
			 text = "The second stage is optimized to provide efficient thrust in near-vacuum conditions.";
		}
		#refinement dependency 'FLR-R010' to MissionRequirementsPackage::'HLR-R062';
	}

	requirement def <'FLR-R011'> OrbitInsertionThrustInitiationRequirement {
		doc /* The system shall initiate third stage propulsion to provide the final thrust needed to achieve a stable Earth orbit. */
		@Rationale {
			 text = "A final, precise propulsive burn is required to circularize the orbit and prevent the vehicle from falling back to Earth.";
		}
		#refinement dependency 'FLR-R011' to MissionRequirementsPackage::'HLR-R003';
	}
	
	requirement def <'FLR-R012'> OrbitInsertionThrustTerminationRequirement {
		doc /* The system shall terminate third stage thrust upon receiving a cutoff command. */
		@Rationale {
			 text = "Precise thrust termination is critical for achieving the correct orbital parameters.";
		}
		#refinement dependency OrbitInsertionThrustTerminationRequirement to MissionRequirementsPackage::'HLR-R003';
	}

	requirement def <'FLR-R013'> AscentGuidanceRequirement {
		doc /* The system shall autonomously control the vehicle's trajectory during ascent according to a pre-programmed flight plan. */
		@Rationale {
			 text = "Automated guidance is necessary to manage the complex, high-speed ascent profile with precision.";
		}
		#refinement dependency AscentGuidanceRequirement to MissionRequirementsPackage::'HLR-R003';
	}

	requirement def <'FLR-R014'> AscentStagingCommandRequirement {
		doc /* The system shall issue commands to separate expended stages at pre-determined points in the ascent profile. */
		@Rationale {
			 text = "Jettisoning mass is essential for maximizing the efficiency of the upper stages.";
		}
		#refinement dependency 'FLR-R014' to MissionRequirementsPackage::'HLR-R003';
	}

	requirement def <'FLR-R015'> CrewAscentMonitoringRequirement {
		doc /* The system shall display critical vehicle parameters to the flight crew during ascent. */
		@Rationale {
			 text = "The crew must have situational awareness to monitor vehicle health and make manual control or abort decisions.";
		}
		#refinement dependency CrewAscentMonitoringRequirement to MissionRequirementsPackage::'HLR-R001';
	}

	requirement def <'FLR-R016'> CrewAscentAbortRequirement {
		doc /* The system shall provide an interface for the crew to manually initiate a launch abort sequence. */
		@Rationale {
			 text = "Manual abort is a key safety feature that provides the crew with ultimate control in a contingency.";
		}
		#refinement dependency CrewAscentAbortRequirement to MissionRequirementsPackage::'HLR-R046';
	}

	requirement def <'FLR-R017'> GroundTelemetryAnalysisRequirement {
		doc /* The system shall receive, process, and display real-time telemetry from the launch vehicle to ground personnel. */
		@Rationale {
			 text = "Ground teams must have accurate, real-time data to monitor vehicle health and provide support.";
		}
		#refinement dependency 'FLR-R017' to MissionRequirementsPackage::'HLR-R048';
	}

	requirement def <'FLR-R018'> GroundPerformanceVerificationRequirement {
		doc /* The system shall compare vehicle performance against pre-defined limits and provide go/no-go recommendations. */
		@Rationale {
			 text = "This function provides an independent verification of vehicle performance, enhancing mission safety.";
		}
		#refinement dependency GroundPerformanceVerificationRequirement to MissionRequirementsPackage::'HLR-R048';
	}

	requirement def <'FLR-R019'> TliThrustInitiationRequirement {
		doc /* The system shall provide a propulsive force to cause the vehicle to escape Earth's orbit. */
		@Rationale {
			 text = "A major propulsive maneuver is required to increase velocity from orbital to escape speed.";
		}
		#refinement dependency 'FLR-R019' to MissionRequirementsPackage::'HLR-R003';
	}
	
	requirement def <'FLR-R020'> TliThrustControlRequirement {
		doc /* The system shall guide the translunar injection burn to achieve the required trajectory accuracy. */
		@Rationale {
			 text = "The accuracy of this burn is critical to ensure the spacecraft arrives at the correct position and time near the Moon.";
		}
		#refinement dependency TliThrustControlRequirement to MissionRequirementsPackage::'HLR-R003';
	}
	
	requirement def <'FLR-R021'> ModuleSeparationRequirement {
		doc /* The system shall enable the primary spacecraft to separate from its launch vehicle adapter. */
		@Rationale {
			 text = "Separation is required before the spacecraft can be reconfigured for the journey to the Moon.";
		}
		#refinement dependency 'FLR-R021' to MissionRequirementsPackage::'HLR-R001';
	}

	requirement def <'FLR-R022'> ModuleRepositioningRequirement {
		doc /* The system shall enable the controlled repositioning of the primary spacecraft after separation. */
		@Rationale {
			 text = "The spacecraft must be turned around to face the stowed lunar module for docking.";
		}
		#refinement dependency 'FLR-R022' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R023'> ModuleConnectionRequirement {
		doc /* The system shall enable the physical connection and sealing of two separate spacecraft modules in space. */
		@Rationale {
			 text = "A rigid, pressurized connection is required to allow for crew transfer and to form the complete translunar vehicle.";
		}
		#refinement dependency 'FLR-R023' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R024'> InSpacePropulsionRequirement {
		doc /* The system shall provide a propulsive force for major in-space trajectory changes. */
		@Rationale {
			 text = "A restartable, high-thrust engine is required for critical maneuvers like lunar orbit insertion and transearth injection.";
		}
		#refinement dependency 'FLR-R024' to MissionRequirementsPackage::'HLR-R061';
	}
	
	requirement def <'FLR-R025'> AttitudeControlRequirement {
		doc /* The system shall provide low-thrust propulsive forces to control the orientation of the spacecraft. */
		@Rationale {
			 text = "Precise attitude control is required for thermal regulation, communications antenna pointing, and alignment for main engine burns.";
		}
		#refinement dependency 'FLR-R025' to MissionRequirementsPackage::'HLR-R061';
	}

	requirement def <'FLR-R026'> NavigationalDataAcquisitionRequirement {
		doc /* The system shall enable the acquisition of celestial navigation data. */
		@Rationale {
			 text = "Regular position fixes are necessary to maintain an accurate understanding of the vehicle's trajectory.";
		}
		#refinement dependency NavigationalDataAcquisitionRequirement to MissionRequirementsPackage::'HLR-R011';
	}

	requirement def <'FLR-R027'> TrajectoryCalculationRequirement {
		doc /* The system shall calculate the vehicle's current trajectory based on navigational data. */
		@Rationale {
			 text = "The current trajectory must be known in order to calculate necessary course corrections.";
		}
		#refinement dependency TrajectoryCalculationRequirement to MissionRequirementsPackage::'HLR-R011';
	}
	
	requirement def <'FLR-R028'> CourseCorrectionCalculationRequirement {
		doc /* The system shall calculate the required propulsive maneuver to correct any deviations from the planned trajectory. */
		@Rationale {
			 text = "This function is essential for ensuring an accurate arrival at the Moon and minimizing fuel usage.";
		}
		#refinement dependency 'FLR-R028' to MissionRequirementsPackage::'HLR-R011';
	}
	
	requirement def <'FLR-R029'> CourseCorrectionExecutionRequirement {
		doc /* The system shall execute a calculated course correction maneuver. */
		@Rationale {
			 text = "The ability to act on calculated corrections is required to maintain the proper flight path.";
		}
		#refinement dependency 'FLR-R029' to MissionRequirementsPackage::'HLR-R011';
	}
	
	requirement def <'FLR-R030'> CrewSystemMonitoringRequirement {
		doc /* The system shall display the status of all critical subsystems to the crew. */
		@Rationale {
			 text = "Continuous situational awareness of system health is required for the crew to manage the mission and respond to anomalies.";
		}
		#refinement dependency CrewSystemMonitoringRequirement to MissionRequirementsPackage::'HLR-R030';
	}
	
	requirement def <'FLR-R031'> GroundSystemMonitoringRequirement {
		doc /* The system shall transmit the status of all critical subsystems to the ground. */
		@Rationale {
			 text = "Ground controllers provide a vital support and analysis function that depends on receiving continuous, accurate telemetry.";
		}
		#refinement dependency 'FLR-R031' to MissionRequirementsPackage::'HLR-R004';
	}
	
	requirement def <'FLR-R032'> SpacecraftDataTransmissionRequirement {
		doc /* The system shall transmit voice, telemetry, and video data to the ground network. */
		@Rationale {
			 text = "Data transmission is required to support ground control functions and meet public engagement objectives.";
		}
		#refinement dependency SpacecraftDataTransmissionRequirement to MissionRequirementsPackage::'HLR-R004';
	}

	requirement def <'FLR-R033'> SpacecraftDataReceptionRequirement {
		doc /* The system shall receive and process commands and voice data from the ground network. */
		@Rationale {
			 text = "The crew must be able to receive updated plans, information, and commands from Mission Control.";
		}
		#refinement dependency SpacecraftDataReceptionRequirement to MissionRequirementsPackage::'HLR-R004';
	}
	
	requirement def <'FLR-R034'> GroundTrackingRequirement {
		doc /* The system shall track the spacecraft's position and velocity from Earth. */
		@Rationale {
			 text = "Continuous tracking is the primary source of navigational data for Mission Control.";
		}
		#refinement dependency GroundTrackingRequirement to MissionRequirementsPackage::'HLR-R048';
	}
	
	requirement def <'FLR-R035'> GroundCommunicationRelayRequirement {
		doc /* The system shall relay communications between the spacecraft and Mission Control. */
		@Rationale {
			 text = "A global network is required to maintain a continuous communications link as the Earth rotates.";
		}
		#refinement dependency GroundCommunicationRelayRequirement to MissionRequirementsPackage::'HLR-R004';
	}
	
	requirement def <'FLR-R036'> CrewActivitySchedulingRequirement {
		doc /* The system shall provide a structured timeline for all crew activities, including work, meals, and sleep. */
		@Rationale {
			 text = "A managed schedule is essential for ensuring crew members are rested and prepared for critical mission events.";
		}
		#refinement dependency CrewActivitySchedulingRequirement to MissionRequirementsPackage::'HLR-R028';
	}
	
	requirement def <'FLR-R037'> CrewRestProvisionRequirement {
		doc /* The system shall provide an environment that allows for crew sleep. */
		@Rationale {
			 text = "Adequate rest is a fundamental requirement for maintaining crew cognitive performance and health.";
		}
		#refinement dependency CrewRestProvisionRequirement to MissionRequirementsPackage::'HLR-R028';
	}

	requirement def <'FLR-R038'> LoiThrustRequirement {
		doc /* The system shall provide a retrograde propulsive force sufficient to reduce the vehicle's velocity for lunar capture. */
		@Rationale {
			 text = "A major braking maneuver is the only way to transition from a fly-by trajectory to a stable lunar orbit.";
		}
		#refinement dependency 'FLR-R038' to MissionRequirementsPackage::'HLR-R061';
	}

	requirement def <'FLR-R039'> LoiGuidanceRequirement {
		doc /* The system shall guide the lunar orbit insertion burn to achieve the target orbital parameters. */
		@Rationale {
			 text = "The accuracy of the lunar orbit is critical for all subsequent operations, including rendezvous and landing.";
		}
		#refinement dependency 'FLR-R039' to MissionRequirementsPackage::'HLR-R011';
	}

	requirement def <'FLR-R040'> LanderSystemVerificationRequirement {
		doc /* The system shall enable the crew to activate and verify the health of all Lunar Module systems prior to separation. */
		@Rationale {
			 text = "The lander's systems must be confirmed to be fully operational before committing to the landing.";
		}
		#refinement dependency 'FLR-R040' to MissionRequirementsPackage::'HLR-R002';
	}

	requirement def <'FLR-R041'> LanderInterfaceVerificationRequirement {
		doc /* The system shall confirm all interfaces between the lander and the main vehicle are ready for separation. */
		@Rationale {
			 text = "A clean separation requires that all physical and data connections are properly configured.";
		}
		#refinement dependency 'FLR-R041' to MissionRequirementsPackage::'HLR-R002';
	}
	
	requirement def <'FLR-R042'> LanderCrewTransferRequirement {
		doc /* The system shall allow the crew to transfer from the primary vehicle to the landing vehicle. */
		@Rationale {
			 text = "The landing crew must be inside the lander before it can be configured for independent flight.";
		}
		#refinement dependency LanderCrewTransferRequirement to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R043'> LanderConfigurationRequirement {
		doc /* The system shall allow the crew to configure the landing vehicle for independent flight. */
		@Rationale {
			 text = "The lander must be switched from a stowed, dormant state to a fully operational one.";
		}
		#refinement dependency 'FLR-R043' to MissionRequirementsPackage::'HLR-R049';
	}

	requirement def <'FLR-R044'> ModuleDisengagementRequirement {
		doc /* The system shall disengage all docking latches connecting two vehicles. */
		@Rationale {
			 text = "This is the primary physical action required to allow two docked vehicles to separate.";
		}
		#refinement dependency 'FLR-R044' to MissionRequirementsPackage::'HLR-R002';
	}

	requirement def <'FLR-R045'> ModuleSeparationManeuverRequirement {
		doc /* The system shall provide a controlled, low-velocity maneuver to create distance between two separated vehicles. */
		@Rationale {
			 text = "A controlled maneuver is required to ensure the two vehicles separate cleanly without re-contact.";
		}
		#refinement dependency 'FLR-R045' to MissionRequirementsPackage::'HLR-R002';
	}
	
	requirement def <'FLR-R046'> DescentPropulsionRequirement {
		doc /* The system shall provide a continuous, throttleable propulsive force to control the rate of descent to the lunar surface. */
		@Rationale {
			 text = "A variable thrust is essential for precisely managing the landing profile, from braking out of orbit to a soft touchdown.";
		}
		#refinement dependency 'FLR-R046' to MissionRequirementsPackage::'HLR-R002';
	}

	requirement def <'FLR-R047'> DescentDataDisplayRequirement {
		doc /* The system shall provide real-time altitude and velocity data to the crew and ground controllers. */
		@Rationale {
			 text = "Accurate, real-time data is critical for both automated guidance and manual piloting during the hazardous landing phase.";
		}
		#refinement dependency 'FLR-R047' to MissionRequirementsPackage::'HLR-R002';
	}

	requirement def <'FLR-R048'> DescentDataProcessingRequirement {
		doc /* The system shall process sensor data to provide accurate navigation information during landing. */
		@Rationale {
			 text = "Raw sensor data must be processed into actionable information for the guidance system and crew.";
		}
		#refinement dependency 'FLR-R048' to MissionRequirementsPackage::'HLR-R002';
	}
	
	requirement def <'FLR-R049'> ManualAttitudeControlRequirement {
		doc /* The system shall allow the crew to take manual control of the lander's attitude. */
		@Rationale {
			 text = "Manual control is a critical function for making fine adjustments to the landing site.";
		}
		#refinement dependency 'FLR-R049' to MissionRequirementsPackage::'HLR-R047';
	}
	
	requirement def <'FLR-R050'> ManualPositionControlRequirement {
		doc /* The system shall enable horizontal repositioning to avoid hazards. */
		@Rationale {
			 text = "The ability to fly over unexpected hazards like craters or boulder fields is essential for landing safety.";
		}
		#refinement dependency 'FLR-R050' to MissionRequirementsPackage::'HLR-R047';
	}
	
	requirement def <'FLR-R051'> PostLandingSafingRequirement {
		doc /* The system shall allow the crew to place all lander systems into a safe, quiescent state after touchdown. */
		@Rationale {
			 text = "Securing the vehicle's systems, especially propulsion, is the first priority after a successful landing.";
		}
		#refinement dependency PostLandingSafingRequirement to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R052'> PostLandingVerificationRequirement {
		doc /* The system shall allow the crew to verify that the vehicle is in a stable state and ready for surface operations. */
		@Rationale {
			 text = "The health of the vehicle must be confirmed before committing to an extravehicular activity.";
		}
		#refinement dependency PostLandingVerificationRequirement to MissionRequirementsPackage::'HLR-R049';
	}

	requirement def <'FLR-R053'> EgressPreparationRequirement {
		doc /* The system shall allow the crew to don and check out their spacesuits. */
		@Rationale {
			 text = "Spacesuit integrity must be confirmed before the crew is exposed to vacuum.";
		}
		#refinement dependency 'FLR-R053' to MissionRequirementsPackage::'HLR-R033';
	}

	requirement def <'FLR-R054'> CabinDepressurizationRequirement {
		doc /* The system shall be capable of depressurizing the lander cabin to the external vacuum environment. */
		@Rationale {
			 text = "Depressurization is a prerequisite for opening the hatch to the lunar surface.";
		}
		#refinement dependency CabinDepressurizationRequirement to MissionRequirementsPackage::'HLR-R033';
	}
	
	requirement def <'FLR-R055'> SurfaceMobilityRequirement {
		doc /* The system shall enable astronauts to traverse the lunar surface. */
		@Rationale {
			 text = "Mobility is fundamental to exploring the area around the lander and performing scientific tasks.";
		}
		#refinement dependency SurfaceMobilityRequirement to MissionRequirementsPackage::'HLR-R036';
	}

	requirement def <'FLR-R056'> SymbolicDeploymentRequirement {
		doc /* The system shall enable the crew to deploy a national symbol on the lunar surface. */
		@Rationale {
			 text = "Fulfilling this key political and public objective of the mission was a primary requirement.";
		}
		#refinement dependency SymbolicDeploymentRequirement to MissionRequirementsPackage::'HLR-R009';
	}
	
	requirement def <'FLR-R057'> SampleCollectionRequirement {
		doc /* The system shall enable the collection of lunar material. */
		@Rationale {
			 text = "The primary scientific objective of the mission was to return physical samples from the Moon.";
		}
		#refinement dependency SampleCollectionRequirement to MissionRequirementsPackage::'HLR-R006';
	}

	requirement def <'FLR-R058'> SampleStorageRequirement {
		doc /* The system shall provide storage for collected samples that prevents terrestrial contamination. */
		@Rationale {
			 text = "The scientific value of the samples depends on them remaining in a pristine, uncontaminated state.";
		}
		#refinement dependency SampleStorageRequirement to MissionRequirementsPackage::'HLR-R038';
	}
	
	requirement def <'FLR-R059'> InstrumentDeploymentRequirement {
		doc /* The system shall enable the crew to deploy scientific experiment packages on the lunar surface. */
		@Rationale {
			 text = "Leaving behind long-term experiments was a key scientific goal to gather data after the crew departed.";
		}
		#refinement dependency InstrumentDeploymentRequirement to MissionRequirementsPackage::'HLR-R007';
	}

	requirement def <'FLR-R060'> VisualTransmissionRequirement {
		doc /* The system shall enable the deployment of a visual transmission system. */
		@Rationale {
			 text = "Transmitting live images from the Moon was a critical public engagement and historical documentation requirement.";
		}
		#refinement dependency 'FLR-R060' to MissionRequirementsPackage::'HLR-R063';
	}
	
	requirement def <'FLR-R061'> EvaIngressRequirement {
		doc /* The system shall allow the crew to re-enter the lander cabin with all collected samples and equipment. */
		@Rationale {
			 text = "A safe return to the pressurized cabin is required to conclude the surface exploration.";
		}
		#refinement dependency EvaIngressRequirement to MissionRequirementsPackage::'HLR-R001';
	}

	requirement def <'FLR-R062'> CabinRepressurizationRequirement {
		doc /* The system shall allow the crew to re-pressurize the lander cabin. */
		@Rationale {
			 text = "A breathable atmosphere must be restored before the crew can doff their spacesuits.";
		}
		#refinement dependency CabinRepressurizationRequirement to MissionRequirementsPackage::'HLR-R005';
	}
	
	requirement def <'FLR-R063'> SurfaceHabitationRequirement {
		doc /* The system shall provide a habitable environment for the crew to sleep and eat on the lunar surface. */
		@Rationale {
			 text = "Crew rest is essential for performance and safety, especially before the critical ascent phase.";
		}
		#refinement dependency SurfaceHabitationRequirement to MissionRequirementsPackage::'HLR-R028';
	}
	
	requirement def <'FLR-R064'> SurfaceTimelineManagementRequirement {
		doc /* The system shall manage the timeline to ensure readiness for ascent within the required orbital mechanics window. */
		@Rationale {
			 text = "The ascent must be timed precisely to allow for a successful rendezvous with the orbiting primary vehicle.";
		}
		#refinement dependency SurfaceTimelineManagementRequirement to MissionRequirementsPackage::'HLR-R049';
	}
	
	requirement def <'FLR-R065'> AscentThrustInitiationRequirement {
		doc /* The system shall initiate the ascent engine using the descent stage as a launch platform. */
		@Rationale {
			 text = "A successful ignition is the single most critical event for getting the crew off the Moon.";
		}
		#refinement dependency 'FLR-R065' to MissionRequirementsPackage::'HLR-R049';
	}
	
	requirement def <'FLR-R066'> AscentPropulsionRequirement {
		doc /* The system shall provide a continuous, non-throttleable propulsive force to achieve lunar orbit. */
		@Rationale {
			 text = "A fixed, highly reliable thrust profile was designed to place the ascent stage into a predictable orbit.";
		}
		#refinement dependency 'FLR-R066' to MissionRequirementsPackage::'HLR-R049';
	}

	requirement def <'FLR-R067'> RendezvousCalculationRequirement {
		doc /* The system shall process tracking data to compute the required maneuvers for rendezvous. */
		@Rationale {
			 text = "Precise calculations are required to ensure the complex orbital mechanics of the rendezvous are successful.";
		}
		#refinement dependency 'FLR-R067' to MissionRequirementsPackage::'HLR-R011';
	}
	
	requirement def <'FLR-R068'> RendezvousExecutionRequirement {
		doc /* The system shall execute a series of precise burns to match the orbit of and approach the target vehicle. */
		@Rationale {
			 text = "The execution of the rendezvous plan is what brings the two vehicles into close proximity for docking.";
		}
		#refinement dependency 'FLR-R068' to MissionRequirementsPackage::'HLR-R011';
	}

	requirement def <'FLR-R069'> DockingApproachRequirement {
		doc /* The system shall allow the crew to pilot the final approach to the target vehicle. */
		@Rationale {
			 text = "Manual control during the terminal phase of docking provides the fine control necessary for a safe connection.";
		}
		#refinement dependency 'FLR-R069' to MissionRequirementsPackage::'HLR-R011';
	}
	
	requirement def <'FLR-R070'> DockingLatchingRequirement {
		doc /* The system shall achieve a successful capture and rigid latching of the two vehicles. */
		@Rationale {
			 text = "A secure, rigid connection is essential for the safe transfer of crew and materials.";
		}
		#refinement dependency 'FLR-R070' to MissionRequirementsPackage::'HLR-R053';
	}
	
	requirement def <'FLR-R071'> IntervehicularCrewTransferRequirement {
		doc /* The system shall allow the crew to move between two docked vehicles. */
		@Rationale {
			 text = "This is the primary function enabled by docking and is required to get the landing crew back into the return vehicle.";
		}
		#refinement dependency IntervehicularCrewTransferRequirement to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R072'> IntervehicularSampleTransferRequirement {
		doc /* The system shall allow the crew to transfer all collected lunar samples to the return vehicle. */
		@Rationale {
			 text = "The scientific goals of the mission are not met until the samples are safely stowed for the journey home.";
		}
		#refinement dependency IntervehicularSampleTransferRequirement to MissionRequirementsPackage::'HLR-R006';
	}
	
	requirement def <'FLR-R073'> AscentStageSeparationRequirement {
		doc /* The system shall allow the crew to seal the hatches and disengage the docking latches. */
		@Rationale {
			 text = "The ascent stage must be separated from the primary vehicle before the journey back to Earth.";
		}
		#refinement dependency 'FLR-R073' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R074'> AscentStageDisposalRequirement {
		doc /* The system shall provide a controlled separation from the ascent stage. */
		@Rationale {
			 text = "The no-longer-needed ascent stage must be disposed of in a safe manner that does not interfere with the primary vehicle.";
		}
		#refinement dependency 'FLR-R074' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R075'> TeiPropulsionRequirement {
		doc /* The system shall provide a propulsive force to cause the vehicle to escape lunar orbit and enter a trans-Earth trajectory. */
		@Rationale {
			 text = "This major propulsive maneuver is the critical event required to start the journey home.";
		}
		#refinement dependency 'FLR-R075' to MissionRequirementsPackage::'HLR-R061';
	}
	
	requirement def <'FLR-R076'> ReentryConfigurationRequirement {
		doc /* The system shall allow the crew to perform final system checks and configure the vehicle for atmospheric entry. */
		@Rationale {
			 text = "The vehicle must be in a specific configuration to survive the stresses of reentry.";
		}
		#refinement dependency ReentryConfigurationRequirement to MissionRequirementsPackage::'HLR-R001';
	}

	requirement def <'FLR-R077'> ServiceModuleJettisonRequirement {
		doc /* The system shall execute a pyrotechnic separation of the primary crew vehicle from its main support module. */
		@Rationale {
			 text = "The main support module is not designed for reentry and must be discarded.";
		}
		#refinement dependency 'FLR-R077' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R078'> CleanSeparationRequirement {
		doc /* The system shall ensure the two separated modules do not re-contact. */
		@Rationale {
			 text = "Re-contact after separation could damage the primary crew vehicle and jeopardize the safety of reentry.";
		}
		#refinement dependency 'FLR-R078' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R079'> ReentryGuidanceRequirement {
		doc /* The system shall use the vehicle's shape and orientation to control its trajectory through the atmosphere. */
		@Rationale {
			 text = "Guidance is required to manage extreme heating and to steer the vehicle toward the target landing zone.";
		}
		#refinement dependency 'FLR-R079' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R080'> HeatDissipationRequirement {
		doc /* The system shall protect the crew and vehicle structure from the extreme heat of atmospheric entry. */
		@Rationale {
			 text = "Without a method to dissipate thermal energy, the vehicle would be destroyed during reentry.";
		}
		#refinement dependency 'FLR-R080' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R081'> DeceleratorDeploymentRequirement {
		doc /* The system shall deploy a sequence of aerodynamic decelerators at pre-defined altitudes. */
		@Rationale {
			 text = "Parachutes are required to slow the vehicle from supersonic speeds to a safe landing velocity.";
		}
		#refinement dependency 'FLR-R081' to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R082'> FinalVelocityRequirement {
		doc /* The system shall slow the vehicle to a safe landing velocity. */
		@Rationale {
			 text = "The final velocity must be low enough to ensure the integrity of the vehicle and the safety of the crew upon impact.";
		}
		#refinement dependency FinalVelocityRequirement to MissionRequirementsPackage::'HLR-R002';
	}
	
	requirement def <'FLR-R083'> WaterLandingRequirement {
		doc /* The system shall execute the final water landing. */
		@Rationale {
			 text = "The mission was designed for a water landing in a pre-determined location.";
		}
		#refinement dependency WaterLandingRequirement to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R084'> PostLandingSystemsRequirement {
		doc /* The system shall automatically deploy flotation devices and beacons after landing. */
		@Rationale {
			 text = "These systems are required to keep the vehicle upright and to aid recovery forces in locating it.";
		}
		#refinement dependency PostLandingSystemsRequirement to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R085'> CrewRecoveryRequirement {
		doc /* The system shall allow recovery forces to locate, secure, and retrieve the crew and crew vehicle from the ocean. */
		@Rationale {
			 text = "The final phase of ensuring crew safety is their successful recovery from the landing site.";
		}
		#refinement dependency CrewRecoveryRequirement to MissionRequirementsPackage::'HLR-R001';
	}
	
	requirement def <'FLR-R086'> VesselTransferRequirement {
		doc /* The system shall transport the crew and crew vehicle to the primary recovery ship. */
		@Rationale {
			 text = "The crew and vehicle must be brought into a controlled environment for post-mission procedures.";
		}
		#refinement dependency VesselTransferRequirement to MissionRequirementsPackage::'HLR-R010';
	}
	
	requirement def <'FLR-R087'> QuarantineImplementationRequirement {
		doc /* The system shall implement Level V biological quarantine procedures for the crew upon recovery. */
		@Rationale {
			 text = "This was a critical planetary protection requirement to prevent potential contamination of Earth's biosphere.";
		}
		#refinement dependency QuarantineImplementationRequirement to MissionRequirementsPackage::'HLR-R010';
	}
	
	requirement def <'FLR-R088'> QuarantineHabitationRequirement {
		doc /* The system shall place the crew into a specialized quarantine facility for a 21-day period. */
		@Rationale {
			 text = "The duration and facility were specified to ensure any potential extraterrestrial organisms could be detected.";
		}
		#refinement dependency QuarantineHabitationRequirement to MissionRequirementsPackage::'HLR-R010';
	}

	requirement def <'FLR-R089'> SamplePreservationRequirement {
		doc /* The system shall place the returned lunar samples into secure, contamination-free containers. */
		@Rationale {
			 text = "The scientific value of the samples depends on them being handled and stored correctly.";
		}
		#refinement dependency SamplePreservationRequirement to MissionRequirementsPackage::'HLR-R038';
	}

	requirement def <'FLR-R090'> SampleTransportRequirement {
		doc /* The system shall transport the samples to a designated receiving laboratory for analysis. */
		@Rationale {
			 text = "The ultimate goal of sample collection is their analysis by the scientific community.";
		}
		#refinement dependency SampleTransportRequirement to MissionRequirementsPackage::'HLR-R006';
	}

	requirement def <'FLR-R091'> TGNCNavigationAccuracy {
		doc /* The Apollo 11 Mission's navigation system shall determine spacecraft position with an accuracy of +/- 5 kilometers
			during Trans-Lunar Coast, at least once every 6 hours. */
		@Rationale {
			text = "Accurate and frequent navigation updates are essential for maintaining the correct trajectory to the Moon, ensuring efficiency and safety during the long Trans-Lunar Coast phase.";
		}

		#refinement dependency 'HLR-R011' to CapabilitiesPackage::AutonomousAndAssistedNavigationGuidanceAndControl;
	}	

	requirement def <'FLR-R092'> ManualPilotingLogic {
		doc /* The Apollo 11 Mission's control system shall enable manual piloting of the lunar lander to allow for
			horizontal repositioning of +/- 200 meters within the landing ellipse to avoid hazards. */
		@Rationale {
			text = "Manual piloting capability is essential for avoiding unexpected surface hazards (e.g., boulders, craters) at the chosen landing site, directly enhancing mission safety and probability of successful landing.";
		}

		#refinement dependency 'FLR-R092' to CapabilitiesPackage::HumanPerformanceUnderExtremeStress;
		#refinement dependency 'FLR-R092' to CapabilitiesPackage::AdaptabilityAndProblemSolving;		
	}


	requirement def <'FLR-R093'> SystemInterfaceCompatibility {
		doc /* All major system interfaces of the Apollo 11 Mission (e.g., spacecraft stacking, docking mechanisms)
			shall demonstrate 100% compatibility through full-scale integrated fit checks and electrical interface tests
			prior to final assembly. */
		@Rationale {
			text = "Perfect interface compatibility is critical to prevent physical or electrical malfunctions between joined spacecraft components, ensuring safe and functional assembly and operation.";
		}

		#refinement dependency 'FLR-R093' to CapabilitiesPackage::ComplexLogisticsAndIntegration;
	}

	requirement def <'FLR-R094'> TrainingSimulatorHours {
		doc /* All flight crew members for the Apollo 11 Mission shall complete a minimum of 200 hours
			of specialized lunar lander simulator training prior to launch. */
		@Rationale {
			text = "Extensive simulator training is crucial to ensure astronauts are highly proficient and prepared for complex and critical operations like lunar landing, enhancing safety and success.";
		}

		#refinement dependency 'FLR-R094' to CapabilitiesPackage::CrewTrainingAndSimulation;
	}			

    requirement def <'FLR-R095'> CourseCorrectionCapability {
        doc /* The guidance system shall calculate and execute trajectory adjustments 
               to maintain the designated mission corridor. */
        @Rationale {
            text = "The mission needs the ability to correct course deviations; the technical accuracy is delegated to technical requirements.";
        }
        #refinement dependency CourseCorrectionCapability to MissionRequirementsPackage::'HLR-R011';
    }

    requirement def <'FLR-R096'> SpacecraftOrientationControl {
        doc /* The system shall autonomously maintain the commanded orientation 
               for thermal regulation and communications. */
        @Rationale {
            text = "Logical function of attitude control. Specific stability metrics belong in the technical level.";
        }
        #refinement dependency SpacecraftOrientationControl to MissionRequirementsPackage::'HLR-R061';
    }

    requirement def <'FLR-R097'> DescentDataAcquisition {
        doc /* The landing system shall acquire real-time altitude and velocity telemetry 
               during the powered descent phase. */
        @Rationale {
            text = "Functional bridge for sensor logic. Specific radar precision metrics are moved to the technical level.";
        }
        #refinement dependency DescentDataAcquisition to MissionRequirementsPackage::'HLR-R002';
    }

    requirement def <'FLR-R098'> LaunchVehicleAscentThrust {
        doc /* The launch system shall provide sufficient total impulse to overcome 
               Earth's gravity and achieve orbit insertion. */
        @Rationale {
            text = "Functional logic for ascent. The specific force magnitude value belongs in the technical layer.";
        }
        #refinement dependency LaunchVehicleAscentThrust to MissionRequirementsPackage::'HLR-R062';
    }

    requirement def <'FLR-R099'> DescentRateModulation {
        doc /* The lander shall provide the capability to vary engine thrust to control 
               the rate of descent to the lunar surface. */
        @Rationale {
            text = "Functional behavior for landing. Throttling percentages are defined in the technical level.";
        }
        #refinement dependency DescentRateModulation to MissionRequirementsPackage::'HLR-R002';
    }

    requirement def <'FLR-R100'> ThermalProtectionLogic {
        doc /* The entry vehicle shall dissipate aerodynamic heat to protect 
               internal volumes during atmospheric return. */
        @Rationale {
            text = "Functional logic of the heat shield. Internal temperature rise limits belong at the technical level.";
        }
        #refinement dependency ThermalProtectionLogic to MissionRequirementsPackage::'HLR-R062';
    }

    requirement def <'FLR-R101'> TouchdownEnergyDissipation {
        doc /* The landing gear system shall mechanically attenuate landing forces 
               to prevent structural damage to the spacecraft. */
        @Rationale {
            text = "Functional description of energy absorption. Velocity metrics are moved to the technical level.";
        }
        #refinement dependency TouchdownEnergyDissipation to MissionRequirementsPackage::'HLR-R002';
    }

    requirement def <'FLR-R102'> AtmosphericScrubbingFunction {
        doc /* The life support system shall remove metabolic byproducts and 
               particles from the cabin air. */
        @Rationale {
            text = "Functional behavior for the ECS. Specific filter efficiencies and levels belong in technical requirements.";
        }
        #refinement dependency AtmosphericScrubbingFunction to MissionRequirementsPackage::'HLR-R005';
    }

    requirement def <'FLR-R103'> TelemetryStreamIntegrity {
        doc /* The communication system shall ensure the fidelity of transmitted 
               data between the spacecraft and ground segment. */
        @Rationale {
            text = "Functional description of data link quality. Integrity metrics belong in technical specifications.";
        }
        #refinement dependency TelemetryStreamIntegrity to MissionRequirementsPackage::'HLR-R063';
    }

    requirement def <'FLR-R104'> EMUPressureMaintenance {
        doc /* The Extravehicular Mobility Unit shall provide a constant pressurized 
               volume for the astronaut in a vacuum environment. */
        @Rationale {
            text = "Functional requirement for suit logic. The specific pressure setpoint belongs in the technical level.";
        }
        #refinement dependency EMUPressureMaintenance to MissionRequirementsPackage::'HLR-R064';
    }

    requirement def <'FLR-R105'> SoftwareMissionProficiency {
        doc /* The flight software shall be verified to perform all guidance 
               and control functions without mission-critical errors. */
        @Rationale {
            text = "Functional goal for software quality. The verification defect rate belongs in the technical level.";
        }
        #refinement dependency SoftwareMissionProficiency to MissionRequirementsPackage::'HLR-R065';
    }

    requirement def <'FLR-R106'> SpaceEnvironmentResilience {
        doc /* Spacecraft materials shall maintain their structural and functional 
               properties under vacuum and thermal cycling. */
        @Rationale {
            text = "Functional resilience goal. Exposure constraints belong in the technical layer.";
        }
        #refinement dependency SpaceEnvironmentResilience to MissionRequirementsPackage::'HLR-R062';
    }



	requirement def <'FLR-R107'> VisualDataCapture {
        doc /* The system shall capture high-resolution still and motion imagery of 
               lunar operations. */
        @Rationale {
            text = "Required to meet scientific and public documentation goals.";
        }
        #refinement dependency 'FLR-R107' to MissionRequirementsPackage::'HLR-R008';
    }

    requirement def <'FLR-R108'> WasteContainmentFunction {
        doc /* The life support system shall provide localized collection and 
               sealed storage for all metabolic waste. */
        @Rationale {
            text = "Essential for maintaining cabin hygiene and crew health.";
        }
        #refinement dependency 'FLR-R108' to MissionRequirementsPackage::'HLR-R026';
    }

    requirement def <'FLR-R109'> CrossVehicleAudioLink {
        doc /* The communication system shall establish a dedicated VHF audio link 
               between the LM and CSM during lunar operations. */
        @Rationale {
            text = "Required for coordination during critical mission phases.";
        }
        #refinement dependency 'FLR-R109' to MissionRequirementsPackage::'HLR-R032';
    }

    requirement def <'FLR-R110'> ComponentFaultTolerance {
        doc /* Critical systems shall maintain nominal output levels despite 
               the loss of any single primary component. */
        @Rationale {
            text = "Implements the redundancy philosophy required for safety.";
        }
        #refinement dependency 'FLR-R110' to MissionRequirementsPackage::'HLR-R045';
    }

    requirement def <'FLR-R111'> HumanMedicalSelfSufficiency {
        doc /* The system shall provide medical kits and diagnostic guides 
               enabling the crew to treat minor injuries. */
        @Rationale {
            text = "Necessary due to the extreme delay in Earth-based assistance.";
        }
        #refinement dependency 'FLR-R111' to MissionRequirementsPackage::'HLR-R052';
    }

    requirement def <'FLR-R112'> DataRedundancyArchiving {
        doc /* The ground segment shall mirror all incoming telemetry to 
               multiple geographic locations for permanent archival. */
        @Rationale {
            text = "Ensures mission data remains available for future generations.";
        }
        #refinement dependency 'FLR-R112' to MissionRequirementsPackage::'HLR-R060';
    }	
}