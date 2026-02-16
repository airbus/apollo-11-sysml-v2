//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package LogicalComponentsPackage {

	private import CoSMAPackage::*;
	private import FunctionsPackage::*;

	part def LaunchSystem :> LogicalComponent {
		doc /* This system's sole purpose is to propel the payload from Earth's surface onto a precise path to the Moon. It is responsible for all functions related to ascent and injection into a translunar trajectory. */
		perform action provideStage1Thrust : ProvideStage1Thrust;
		perform action provideStage2Thrust : ProvideStage2Thrust;
		perform action provideOrbitInsertionThrust : ProvideOrbitInsertionThrust;
		perform action guideAscentTrajectory : GuideAscentTrajectory;
		perform action provideTranslunarInjectionThrust : ProvideTranslunarInjectionThrust;
		perform action controlTranslunarInjectionBurn : ControlTranslunarInjectionBurn;
	}

	part def Spacecraft :> LogicalComponent {
		/* This system comprises the vehicles that travel to, operate at, and return from the Moon. It handles all functions related to in-space travel, life support, landing, and returning through Earth's atmosphere. */
		perform action provideAttitudeControlThrust : ProvideAttitudeControlThrust;
		perform action mechanicallyLatchModules : MechanicallyLatchModules;
		perform action calculateCourseCorrection : CalculateCourseCorrection;
		perform action executeCourseCorrectionBurn : ExecuteCourseCorrectionBurn;
		perform action transmitAndReceiveSpacecraftSignals : TransmitAndReceiveSpacecraftSignals;
		perform action provideLunarOrbitInsertionThrust : ProvideLunarOrbitInsertionThrust;
		perform action controlLunarOrbitInsertionBurn : ControlLunarOrbitInsertionBurn;
		perform action separateLanderFromOrbiter : SeparateLanderFromOrbiter;
		perform action executeDescentBurn : ExecuteDescentBurn;
		perform action executeAscentBurn : ExecuteAscentBurn;
		perform action calculateRendezvousManeuvers : CalculateRendezvousManeuvers;
		perform action executeRendezvousBurns : ExecuteRendezvousBurns;
		perform action discardAscentStage : DiscardAscentStage;
		perform action executeTransearthBurn : ExecuteTransearthBurn;
		perform action separateReturnCapsule : SeparateReturnCapsule;
		perform action guideAtmosphericEntry : GuideAtmosphericEntry;
		perform action deployDecelerators : DeployDecelerators;
		perform action performSplashdown : PerformSplashdown;
	}

	part def GroundSupportSystem :> LogicalComponent {
		doc /* This system is the Earth-based infrastructure and personnel that manage, control, and support the mission from start to finish. */
		perform action performPropellantLoading : PerformPropellantLoading;
		perform action performCrewIngress : PerformCrewIngress;
		perform action retrieveVehicleAndCrew : RetrieveVehicleAndCrew;
		perform action executeQuarantine : ExecuteQuarantine;
		perform action secureReturnedSamples : SecureReturnedSamples;
		
		perform action executeTerminalCountdown : ExecuteTerminalCountdown;
		perform action analyzeLaunchTelemetryFromGround : AnalyzeLaunchTelemetryFromGround;
		perform action monitorDownlinkedTelemetry : MonitorDownlinkedTelemetry;		
		perform action monitorDescent : MonitorDescent;
	}

	part def DataTransmissionNetwork {
		doc /* The system to relay and transmit data between the SoS elements. */
		perform action trackAndRelayGroundSignals : TrackAndRelayGroundSignals;
	}

	part def EVASystem :> LogicalComponent {
		doc /* This system consists of the personal equipment required for an astronaut to live and work in the vacuum of space on the lunar surface. */
		perform action provideIndividualLifesupport: ProvideIndividualLifesupport;
	}

	part def Crew :> LogicalComponent {
		doc /* This system represents the human operators who pilot the spacecraft, conduct experiments, and make real-time decisions. */
		perform action observeAscentDataFromCockpit : ObserveAscentDataFromCockpit;
		perform action executeTranspositionManeuver : ExecuteTranspositionManeuver;
		perform action monitorOnboardSystems : MonitorOnboardSystems;
		perform action manageCrewSchedules : ManageCrewSchedules;
		perform action performOrbitalSystemCheckouts : PerformOrbitalSystemCheckouts;
		perform action prepareLanderForSeparation : PrepareLanderForSeparation;
		perform action manuallyPilotLander : ManuallyPilotLander;
		perform action performPostLandingCheck : PerformPostLandingCheck;
		perform action prepareForExtravehicularActivity : PrepareForExtravehicularActivity;
		perform action conductSurfaceExploration : ConductSurfaceExploration;
		perform action gatherLunarSamples : GatherLunarSamples;
		perform action deploySurfaceExperiments : DeploySurfaceExperiments;
		perform action completeExtravehicularActivity : CompleteExtravehicularActivity;
		perform action conductSurfaceRestPeriod : ConductSurfaceRestPeriod;
		perform action connectSpacecraft : ConnectSpacecraft;
		perform action transferCrewAndMaterials : TransferCrewAndMaterials;
		perform action prepareVehicleForReentry : PrepareVehicleForReentry;
	}
}