//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package FunctionsPackage {
	
	private import MissionPhasesPackage::*;
	private import MissionRequirementsPackage::*;
	private import ScalarValues::*;
	private import ModelingMetadata::*;
	private import CoSMAPackage::*;

	item def VehicleStatus { doc /* Represents the complete state of a vehicle system, including configuration, resources, and trajectory. */ }
	item def CrewStatus { doc /* Represents the state of the crew, including health and readiness. */ }
	item def MissionPlan { doc /* Contains the overall objectives and parameters for the mission. */ }
	item def LunarSamples { doc /* Represents the collected geological materials from the Moon. */ }
	item def ScientificData { doc /* Represents data gathered from deployed scientific instruments. */ }
	item def MissionReport { doc /* A comprehensive report detailing the outcomes of the mission. */ }

	// ===================================================================
	//  Level 4: Leaf-Level Function Definitions
	//  NOTE: These functions refine the abstract Operations from the MissionPhasesPackage.
	// ===================================================================
	
	action def PerformPropellantLoading :> Function {
		in currentStatus: VehicleStatus;
		out loadedStatus: VehicleStatus;
		doc /* Fills and conditions all necessary propellants and consumables for the mission. */
		#refinement dependency PerformPropellantLoading to OperationsPackage::LoadConsumablesAndPropellants;
	}
	
	action def PerformCrewIngress :> Function {
		out isCrewAboard: Boolean;
		doc /* Transfers the flight crew into the vehicle and secures them for launch. */
		#refinement dependency PerformCrewIngress to OperationsPackage::TransferCrewToVehicle;
	}
	
	action def ExecuteTerminalCountdown :> Function {
		out goForLaunch: Boolean;
		doc /* Executes the final automated and manual checks leading to launch. */
		#refinement dependency ExecuteTerminalCountdown to OperationsPackage::PerformPreLaunchCountdown;
	}
	action def ProvideStage1Thrust :> Function {
		in launchReadyStatus: VehicleStatus;
		out stage1BurnoutStatus: VehicleStatus;
		doc /* Provides primary thrust from liftoff through the first two and a half minutes of flight. */
		#refinement dependency ProvideStage1Thrust to OperationsPackage::ExecuteLaunchSequence;
	}
	action def ProvideStage2Thrust :> Function {
		in stage1BurnoutStatus: VehicleStatus;
		out stage2BurnoutStatus: VehicleStatus;
		doc /* Provides thrust after first stage separation to propel the vehicle to the edge of space. */
		#refinement dependency ProvideStage2Thrust to OperationsPackage::ExecuteLaunchSequence;
	}
	action def ProvideOrbitInsertionThrust :> Function {
		in stage2BurnoutStatus: VehicleStatus;
		out orbitalStatus: VehicleStatus;
		doc /* Provides the final thrust needed to achieve a stable Earth orbit. */
		#refinement dependency ProvideOrbitInsertionThrust to OperationsPackage::ExecuteLaunchSequence;
	}
	action def GuideAscentTrajectory :> Function {
		in ascentStatus: VehicleStatus;
		out guidedStatus: VehicleStatus;
		doc /* Autonomously executes the pre-programmed flight plan, controlling engine gimbaling and staging events. */
		#refinement dependency GuideAscentTrajectory to OperationsPackage::MonitorAscentTrajectory;
	}
	action def ObserveAscentDataFromCockpit :> Function {
		in ascentStatus: VehicleStatus;
		doc /* Allows the crew to monitor spacecraft displays and provides manual inputs or abort commands if necessary. */
		#refinement dependency ObserveAscentDataFromCockpit to OperationsPackage::MonitorAscentTrajectory;
	}
	action def AnalyzeLaunchTelemetryFromGround :> Function {
		in ascentStatus: VehicleStatus;
		doc /* Receives and analyzes telemetry on the ground to provide go/no-go decisions to the crew. */
		#refinement dependency AnalyzeLaunchTelemetryFromGround to OperationsPackage::MonitorAscentTrajectory;
	}
	
	action def ProvideTranslunarInjectionThrust :> Function {
		in currentStatus: VehicleStatus;
		out postBurnStatus: VehicleStatus;
		doc /* Re-ignites the engine to propel the spacecraft out of Earth orbit and toward the Moon. */
		#refinement dependency ProvideTranslunarInjectionThrust to OperationsPackage::ExecuteTLIBurn;
	}
	action def ControlTranslunarInjectionBurn :> Function {
		in currentStatus: VehicleStatus;
		doc /* Guides the TLI burn to ensure accuracy. */
		#refinement dependency ControlTranslunarInjectionBurn to OperationsPackage::ExecuteTLIBurn;
	}
	action def ExecuteTranspositionManeuver :> Function {
		in currentStatus: VehicleStatus;
		out maneuveringStatus: VehicleStatus;
		doc /* Pilots the Command/Service Module after separation from the S-IVB stage. */
		#refinement dependency ExecuteTranspositionManeuver to OperationsPackage::PerformTranspositionDockingExtraction;
	}
	action def ProvideAttitudeControlThrust :> Function {
		in currentStatus: VehicleStatus;
		out newAttitudeStatus: VehicleStatus;
		doc /* Fires Reaction Control System thrusters to orient the spacecraft. */
		#refinement dependency ProvideAttitudeControlThrust to OperationsPackage::PerformTranspositionDockingExtraction;
	}
	action def MechanicallyLatchModules :> Function {
		in currentStatus: VehicleStatus;
		out dockedStatus: VehicleStatus;
		doc /* Engages the docking probe and latches to form a rigid connection between two modules. */
		#refinement dependency MechanicallyLatchModules to OperationsPackage::PerformTranspositionDockingExtraction;
	}
	action def CalculateCourseCorrection :> Function {
		in currentStatus: VehicleStatus;
		out burnPlan: VehicleStatus; // Using VehicleStatus to represent the plan
		doc /* Processes navigational data to determine the required vector for a mid-course correction burn. */
		#refinement dependency CalculateCourseCorrection to OperationsPackage::ConductMidCourseCorrections;
	}
	action def ExecuteCourseCorrectionBurn :> Function {
		in burnPlan: VehicleStatus;
		out correctedStatus: VehicleStatus;
		doc /* Fires the main engine or RCS thrusters to execute the planned trajectory adjustment. */
		#refinement dependency ExecuteCourseCorrectionBurn to OperationsPackage::ConductMidCourseCorrections;
	}
	
	action def MonitorOnboardSystems :> Function {
		in currentStatus: VehicleStatus;
		doc /* Allows the crew to observe and manage spacecraft systems from inside the cabin. */
		#refinement dependency MonitorOnboardSystems to OperationsPackage::MonitorSpacecraftSystems;
	}
	action def MonitorDownlinkedTelemetry :> Function {
		in currentStatus: VehicleStatus;
		doc /* Allows ground controllers to observe spacecraft systems via telemetry. */
		#refinement dependency MonitorDownlinkedTelemetry to OperationsPackage::MonitorSpacecraftSystems;
	}
	action def TransmitAndReceiveSpacecraftSignals :> Function {
		in currentStatus: VehicleStatus;
		doc /* Manages the vehicle's antennas and radios to send and receive data. */
		#refinement dependency TransmitAndReceiveSpacecraftSignals to OperationsPackage::CommunicateWithMissionControl;
	}
	
	action def TrackAndRelayGroundSignals :> Function {
		doc /* Manages the global network of ground stations to maintain a continuous link with the spacecraft. */
		#refinement dependency TrackAndRelayGroundSignals to OperationsPackage::CommunicateWithMissionControl;
	}
	action def ManageCrewSchedules :> Function {
		in currentStatus: CrewStatus;
		out restedStatus: CrewStatus;
		doc /* Manages the schedule for crew work, sleep, and meals. */
		#refinement dependency ManageCrewSchedules to OperationsPackage::ManageCrewRestPeriods;
	}
	action def ProvideLunarOrbitInsertionThrust :> Function {
		in currentStatus: VehicleStatus;
		out postBurnStatus: VehicleStatus;
		doc /* Fires the main engine to slow the spacecraft for lunar capture. */
		#refinement dependency ProvideLunarOrbitInsertionThrust to OperationsPackage::ExecuteLOIBurn;
	}
	
	action def ControlLunarOrbitInsertionBurn :> Function {
		in currentStatus: VehicleStatus;
		out finalStatus: VehicleStatus;
		doc /* Guides the LOI burn to achieve the target orbit. */
		#refinement dependency ControlLunarOrbitInsertionBurn to OperationsPackage::ExecuteLOIBurn;
	}
	
	action def PerformOrbitalSystemCheckouts :> Function {
		in currentStatus: VehicleStatus;
		out checkedVehicle: VehicleStatus;
		doc /* Performs system health checks while in lunar orbit. */
		#refinement dependency PerformOrbitalSystemCheckouts to OperationsPackage::ConductLunarOrbitCheckouts;
	}
	action def PrepareLanderForSeparation :> Function {
		in currentStatus: VehicleStatus;
		out preppedVehicle: VehicleStatus;
		doc /* Activates and configures the Lunar Module for independent flight. */
		#refinement dependency PrepareLanderForSeparation to OperationsPackage::PrepareLMforUndocking;
	}
	action def SeparateLanderFromOrbiter :> Function {
		in currentStatus: VehicleStatus;
		out lander: VehicleStatus;
		out orbiter: VehicleStatus;
		doc /* Physically separates the two spacecraft. */
		#refinement dependency SeparateLanderFromOrbiter to OperationsPackage::PerformLMUndocking;
	}
	action def ExecuteDescentBurn :> Function {
		in currentStatus: VehicleStatus;
		out descentStatus: VehicleStatus;
		doc /* Manages the main engine burn for powered descent. */
		#refinement dependency ExecuteDescentBurn to OperationsPackage::ExecutePoweredDescentBurn;
	}
	action def MonitorDescent :> Function {
		in currentStatus: VehicleStatus;
		out monitoredStatus: VehicleStatus;
		doc /* Tracks altitude and velocity telemetry during landing. */
		#refinement dependency MonitorDescent to OperationsPackage::MonitorDescentTelemetry;
	}
	action def ManuallyPilotLander :> Function {
		in currentStatus: VehicleStatus;
		out pilotedStatus: VehicleStatus;
		doc /* Allows for manual control of the lander to avoid hazards. */
		#refinement dependency ManuallyPilotLander to OperationsPackage::PerformManualPiloting;
	}
	action def PerformPostLandingCheck :> Function {
		in currentStatus: VehicleStatus;
		doc /* Verifies the state of the vehicle after landing on the Moon. */
		#refinement dependency PerformPostLandingCheck to OperationsPackage::ConductLMPostLandingChecks;
	}
	action def PrepareForExtravehicularActivity :> Function {
		in currentStatus: VehicleStatus;
		doc /* Prepares the cabin and suits for surface exploration. */
		#refinement dependency PrepareForExtravehicularActivity to OperationsPackage::PrepareForEVA;
	}
	action def ProvideIndividualLifesupport :> Function {
		doc /* Provide life support for crew member on the lunar surface outside the lander. */
		#refinement dependency ProvideIndividualLifesupport to OperationsPackage::PerformLunarEVA;
	}
	
	action def ConductSurfaceExploration :> Function {
		in currentStatus: VehicleStatus;
		doc /* The act of the crew operating on the lunar surface. */
		#refinement dependency ConductSurfaceExploration to OperationsPackage::PerformLunarEVA;
	}
	action def GatherLunarSamples :> Function {
		out samples: LunarSamples;
		doc /* Collects and stores geological samples. */
		#refinement dependency GatherLunarSamples to OperationsPackage::CollectLunarSamples;
	}
	action def DeploySurfaceExperiments :> Function {
		out scienceData: ScientificData;
		doc /* Sets up scientific instrument packages on the lunar surface. */
		#refinement dependency DeploySurfaceExperiments to OperationsPackage::DeployScientificInstruments;
	}
	
	action def CompleteExtravehicularActivity :> Function {
		in currentStatus: VehicleStatus;
		doc /* Concludes the surface exploration and has the crew re-enter the vehicle. */
		#refinement dependency CompleteExtravehicularActivity to OperationsPackage::ConcludeEVA;
	}
	
	action def ConductSurfaceRestPeriod :> Function {
		doc /* Manages the crew rest period while on the lunar surface. */
		#refinement dependency ConductSurfaceRestPeriod to OperationsPackage::ManageLunarSurfaceRestPeriod;
	}
	
	action def ExecuteAscentBurn :> Function {
		in currentStatus: VehicleStatus;
		out ascentVehicle: VehicleStatus;
		doc /* Fires the ascent engine to lift off from the Moon. */
		#refinement dependency ExecuteAscentBurn to OperationsPackage::ExecuteLunarAscentBurn;
	}
	
	action def CalculateRendezvousManeuvers :> Function {
		in currentStatus: VehicleStatus;
		out rendezvousPlan: VehicleStatus;
		doc /* Processes tracking data to compute the required burns for rendezvous. */
		#refinement dependency CalculateRendezvousManeuvers to OperationsPackage::PerformRendezvousManeuvers;
	}
	action def ExecuteRendezvousBurns :> Function {
		in rendezvousPlan: VehicleStatus;
		out proximalVehicle: VehicleStatus;
		doc /* Fires RCS thrusters to execute the rendezvous plan and approach the target vehicle. */
		#refinement dependency ExecuteRendezvousBurns to OperationsPackage::PerformRendezvousManeuvers;
	}	
	
	action def ConnectSpacecraft :> Function {
		in currentStatus: VehicleStatus;
		out dockedVehicle: VehicleStatus;
		doc /* Performs the physical docking of the two vehicles. */
		#refinement dependency ConnectSpacecraft to OperationsPackage::ConductLMCSMDocking;
	}
	action def TransferCrewAndMaterials :> Function {
		in currentStatus: VehicleStatus;
		in samples: LunarSamples;
		out postTransferVehicle: VehicleStatus;
		doc /* Moves the crew and collected samples from the ascent stage to the main vehicle. */
		#refinement dependency TransferCrewAndMaterials to OperationsPackage::TransferCrewAndSamples;
	}
	action def DiscardAscentStage :> Function {
		in currentStatus: VehicleStatus;
		out finalVehicle: VehicleStatus;
		doc /* Jettisons the Lunar Module ascent stage. */
		#refinement dependency DiscardAscentStage to OperationsPackage::JettisonLM;
	}
	action def ExecuteTransearthBurn :> Function {
		in currentStatus: VehicleStatus;
		out finalStatus: VehicleStatus;
		doc /* Performs the major propulsive maneuver to leave lunar orbit for Earth. */
		#refinement dependency ExecuteTransearthBurn to OperationsPackage::ExecuteTEIBurn;
	}
	action def PrepareVehicleForReentry :> Function {
		in currentStatus: VehicleStatus;
		out finalStatus: VehicleStatus;
		doc /* Configures the main vehicle for atmospheric entry. */
		#refinement dependency PrepareVehicleForReentry to OperationsPackage::PrepareCMforReentry;
	}
	action def SeparateReturnCapsule :> Function {
		in currentStatus: VehicleStatus;
		out capsule: VehicleStatus;
		doc /* Jettisons the service module before entering the atmosphere. */
		#refinement dependency SeparateReturnCapsule to OperationsPackage::SeparateModules;
	}
	action def GuideAtmosphericEntry :> Function {
		in currentStatus: VehicleStatus;
		out reentryStatus: VehicleStatus;
		doc /* Controls the vehicle's trajectory through the atmosphere to manage heat and aim for the landing zone. */
		#refinement dependency GuideAtmosphericEntry to OperationsPackage::GuideReentryTrajectory;
	}
	action def DeployDecelerators :> Function {
		in currentStatus: VehicleStatus;
		out descentStatus: VehicleStatus;
		doc /* Deploys the parachute system to slow the vehicle for landing. */
		#refinement dependency DeployDecelerators to OperationsPackage::DeployParachutes;
	}
	action def PerformSplashdown :> Function {
		in currentStatus: VehicleStatus;
		out finalStatus: VehicleStatus;
		doc /* Manages the final water landing. */
		#refinement dependency PerformSplashdown to OperationsPackage::ConductSplashdownOperations;
	}
	action def RetrieveVehicleAndCrew :> Function {
		in currentStatus: VehicleStatus;
		out recoveredCrew: CrewStatus;
		out recoveredVehicle: VehicleStatus;
		doc /* Locates and recovers the crew and capsule from the ocean. */
		#refinement dependency RetrieveVehicleAndCrew to OperationsPackage::RetrieveCrewAndCM;
	}
	action def ExecuteQuarantine :> Function {
		in crew: CrewStatus;
		doc /* Implements biological isolation protocols for the crew. */
		#refinement dependency ExecuteQuarantine to OperationsPackage::InitiateQuarantineProcedures;
	}
	action def SecureReturnedSamples :> Function {
		in samples: LunarSamples;
		out finalSamples: LunarSamples;
		doc /* Secures the collected lunar materials for scientific study. */
		#refinement dependency SecureReturnedSamples to OperationsPackage::SecureLunarSamples;
	}

	// ===================================================================
	//  Level 1-3 Functions (Orchestrating Leaf-Level Functions)
	// ===================================================================

	action def PerformLunarMission :> Function {
		in plan: MissionPlan;
		in vehicleSystem: VehicleStatus;
		in flightCrew: CrewStatus;
		out finalReport: MissionReport;
		doc /* The top-level function to transport a human crew to the lunar surface, enable exploration, and return them safely to Earth. */
		action outbound: ExecuteOutboundJourney;
		action lunarOps: ConductLunarOperations;
		action returnJourney: ExecuteReturnJourney;
	}

	action def ExecuteOutboundJourney :> Function {
		in launchReadySystem: VehicleStatus;
		in crew: CrewStatus;
		out vehicleInLunarOrbit: VehicleStatus;
		doc /* To execute all operations required to travel from a pre-launch state on Earth to achieving a stable orbit around the Moon. */
		action prep: PrepareForLaunch;
		action launch: LaunchToOrbit;
		action tli: SetTranslunarCourse;
		action coast: TraverseToMoon;
		action loi: AchieveLunarOrbit;
	}

	action def ConductLunarOperations :> Function {
		in vehicleInLunarOrbit: VehicleStatus;
		out returnReadyVehicle: VehicleStatus;
		out samples: LunarSamples;
		out science: ScientificData;
		doc /* To perform all operations in the lunar environment, including landing, exploration, and returning to the main vehicle in lunar orbit. */
		action prepLanding: PrepareForLanding;
		action land: LandOnSurface;
		action explore: ExploreLunarSurface;
		action ascendAndDock: ReturnToOrbitAndDock;
	}

	action def ExecuteReturnJourney :> Function {
		in returnReadyVehicle: VehicleStatus;
		in samples: LunarSamples;
		out recoveredCrew: CrewStatus;
		out recoveredSamples: LunarSamples;
		doc /* To execute all operations required to leave lunar orbit, travel back to Earth, and safely recover the crew and mission assets. */
		action tei: SetTransearthCourse;
		action coast: TraverseToEarth;
		action land: ReenterAndLand;
        action recover: RecoverCrewAndAssets;
	}

	action def PrepareForLaunch :> Function {
		in assembledVehicle: VehicleStatus;
		in crew: CrewStatus;
		out launchReadyVehicle: VehicleStatus;
		out readyCrew: CrewStatus;
		doc /* Covers final ground preparations. Corresponds to the PrepareForMissionPhase. */
		action load: PerformPropellantLoading;
		action board: PerformCrewIngress;
	}

	action def LaunchToOrbit :> Function {
		in launchReadyVehicle: VehicleStatus;
		out vehicleInEarthOrbit: VehicleStatus;
		doc /* Applies motive force to overcome gravity and achieve a stable Earth orbit. Corresponds to the LaunchPhase. */
		action countdown: ExecuteTerminalCountdown;
		action provideThrust1: ProvideStage1Thrust;
		action provideThrust2: ProvideStage2Thrust;
		action provideThrust3: ProvideOrbitInsertionThrust;
		action guide: GuideAscentTrajectory;
		action observe: ObserveAscentDataFromCockpit;
		action analyze: AnalyzeLaunchTelemetryFromGround;
	}

	action def SetTranslunarCourse :> Function {
		in vehicleInEarthOrbit: VehicleStatus;
		out vehicleOnTranslunarTrajectory: VehicleStatus;
		doc /* Executes a propulsive maneuver to leave Earth orbit and reconfigure the vehicle. Corresponds to the TransLunarInjectionPhase. */
		action executeTransposition: ExecuteTranspositionManeuver;
		action provideAttitudeControlAndThrust: ProvideAttitudeControlThrust;
		action reconfigure: MechanicallyLatchModules;
		action burn: ProvideTranslunarInjectionThrust;
		action control: ControlTranslunarInjectionBurn;
	}
	
	action def TraverseToMoon :> Function {
		in vehicleOnTranslunarTrajectory: VehicleStatus;
		out vehicleInLunarSphere: VehicleStatus;
		doc /* Navigates the vehicle across cislunar space. Corresponds to the TransLunarCoastPhase. */
		action calculate: CalculateCourseCorrection;
		action correct: ExecuteCourseCorrectionBurn;
		action monitorOnboard: MonitorOnboardSystems;
		action monitorGround: MonitorDownlinkedTelemetry;
		action comms: TransmitAndReceiveSpacecraftSignals;
		action trackAndRelay: TrackAndRelayGroundSignals;
		action rest: ManageCrewSchedules;
	}

	action def AchieveLunarOrbit :> Function {
		in vehicleInLunarSphere: VehicleStatus;
		out vehicleInStableLunarOrbit: VehicleStatus;
		doc /* Executes a propulsive maneuver for gravitational capture by the Moon. Corresponds to the LunarOrbitInsertionPhase. */
		action burn: ProvideLunarOrbitInsertionThrust;
		action control : ControlLunarOrbitInsertionBurn;
	}

	action def PrepareForLanding :> Function {
		in combinedVehicle: VehicleStatus;
		out separatedLander: VehicleStatus;
		out separatedOrbiter: VehicleStatus;
		doc /* Prepares and separates the landing vehicle from the main vehicle. Corresponds to the LunarOrbitOperationsDescentPreparationPhase. */
		action checkout: PerformOrbitalSystemCheckouts;
		action prep: PrepareLanderForSeparation;
		action undock: SeparateLanderFromOrbiter;
	}

	action def LandOnSurface :> Function {
		in landingVehicle: VehicleStatus;
		out vehicleOnSurface: VehicleStatus;
		doc /* Executes a controlled, powered descent from lunar orbit to the surface. Corresponds to the PoweredDescentPhase. */
		action burn: ExecuteDescentBurn;
		action monitor: MonitorDescent;
		action pilot: ManuallyPilotLander;
	}

	action def ExploreLunarSurface :> Function {
		in vehicleOnSurface: VehicleStatus;
		out collectedSamples: LunarSamples;
		out deployedScience: ScientificData;
		doc /* Conducts all planned extravehicular activities on the Moon. Corresponds to the LunarSurfaceOperationsPhase. */
		action postLand: PerformPostLandingCheck;
		action prepEva: PrepareForExtravehicularActivity;
		action provideIndividualLifesupport: ProvideIndividualLifesupport;
		action eva: ConductSurfaceExploration;
		action collect: GatherLunarSamples;
		action deploy: DeploySurfaceExperiments;
		action conclude: CompleteExtravehicularActivity;
		action rest: ConductSurfaceRestPeriod;
	}

	action def ReturnToOrbitAndDock :> Function {
		in ascentVehicleOnSurface: VehicleStatus;
		in mainVehicleInOrbit: VehicleStatus;
		in samplesToTransfer: LunarSamples;
		out mainVehicleWithCrew: VehicleStatus;
		doc /* Leaves the lunar surface, achieves orbit, and physically connects with the primary vehicle. Corresponds to the LunarAscentRendezvousPhase. */
		action ascend: ExecuteAscentBurn;
		action calculate : CalculateRendezvousManeuvers;
		action rendezvous: ExecuteRendezvousBurns;
		action dock: ConnectSpacecraft;
		action transfer: TransferCrewAndMaterials;
		action jettison: DiscardAscentStage;
	}

	action def SetTransearthCourse :> Function {
		in mainVehicleInLunarOrbit: VehicleStatus;
		out vehicleOnTransearthTrajectory: VehicleStatus;
		doc /* Executes a propulsive maneuver to leave lunar orbit and begin the journey to Earth. Corresponds to the TransEarthInjectionPhase. */
		action burn: ExecuteTransearthBurn;
	}

	action def TraverseToEarth :> Function {
		in vehicleOnTransearthTrajectory: VehicleStatus;
		out reentryReadyVehicle: VehicleStatus;
		doc /* Navigates the vehicle to Earth and prepares for reentry. Corresponds to the TransEarthCoastPhase. */
		action monitorSystems: MonitorOnboardSystems;
		action monitorTelemetry : MonitorDownlinkedTelemetry;
		action transmitAndReceive: TransmitAndReceiveSpacecraftSignals;
		action trackAndRelay: TrackAndRelayGroundSignals;
		action prep: PrepareVehicleForReentry;
	}

	action def ReenterAndLand :> Function {
		in reentryReadyVehicle: VehicleStatus;
		out landedVehicle: VehicleStatus;
		doc /* Manages atmospheric entry and executes a safe landing. Corresponds to the ReentryLandingPhase. */
		action separate: SeparateReturnCapsule;
		action guide: GuideAtmosphericEntry;
		action deploy: DeployDecelerators;
		action splashdown: PerformSplashdown;
	}

	action def RecoverCrewAndAssets :> Function {
		in landedVehicle: VehicleStatus;
		in samplesOnboard: LunarSamples;
		out securedCrew: CrewStatus;
		out securedSamples: LunarSamples;
		doc /* Retrieves the crew and vehicle and initiates post-mission protocols. Corresponds to the RecoveryQuarantinePhase. */
		action retrieve: RetrieveVehicleAndCrew;
		action quarantine: ExecuteQuarantine;
		action secure: SecureReturnedSamples;
	}
}