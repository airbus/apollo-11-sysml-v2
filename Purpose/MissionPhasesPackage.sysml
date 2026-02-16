//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package MissionPhasesPackage {

	private import CoSMAPackage::*;
	private import OperationsPackage::*;

	// --- Item Definitions (Representing Completion Notifications/Triggers) ---
	item def PreparationPhaseCompletedNotification;
	item def LaunchPhaseCompletedNotification;
	item def TransLunarInjectionPhaseCompletedNotification;
	item def TransLunarCoastPhaseCompletedNotification;
	item def LunarOrbitInsertionPhaseCompletedNotification;
	item def LunarOrbitOperationsDescentPreparationPhaseCompletedNotification;
	item def PoweredDescentPhaseCompletedNotification;
	item def LunarSurfaceOperationsPhaseCompletedNotification;
	item def LunarAscentRendezvousPhaseCompletedNotification;
	item def TransEarthInjectionPhaseCompletedNotification;
	item def TransEarthCoastPhaseCompletedNotification;
	item def ReentryLandingPhaseCompletedNotification;
	item def RecoveryQuarantinePhaseCompletedNotification;

	// States
	state def PrepareForMissionPhase :> Phase {
		do action prepareForMissionPhaseOperations {
			first start;
			then action loadConsumablesAndPropellants : LoadConsumablesAndPropellants;
			then action transferCrewToVehicle : TransferCrewToVehicle;	
			then done;
		}
	}

	state def LaunchPhase :> Phase {
		do action launchPhaseOperations {
			first start;
			then action performPreLaunchCountdown : PerformPreLaunchCountdown;
			then action executeLaunchSequence : ExecuteLaunchSequence;
			then action monitorAscentTrajectory : MonitorAscentTrajectory;
			then done;
		}
	}
	state def TransLunarInjectionPhase :> Phase {
		do action tliPhaseOperations {
			first start;
			then action executeTLIBurn : ExecuteTLIBurn;
			then action performTranspositionDockingExtraction : PerformTranspositionDockingExtraction;
			then done;
		}
	}
	state def TransLunarCoastPhase :> Phase {
		do action tlcPhaseOperations {
			first start;
			then action conductMidCourseCorrections : ConductMidCourseCorrections;
			then action monitorSpacecraftSystems : MonitorSpacecraftSystems;
			then action communicateWithMissionControl : CommunicateWithMissionControl;
			then action manageCrewRestPeriods : ManageCrewRestPeriods;
			then done;
		}
	}
	state def LunarOrbitInsertionPhase :> Phase {
		do action loiPhaseOperations {
			first start;
			then action executeLOIBurn : ExecuteLOIBurn;
			then done;
		}
	}
	state def LunarOrbitOperationsDescentPreparationPhase :> Phase {
		do action lunarOpsDescentPrepOperations {
			first start;
			then action conductLunarOrbitCheckouts : ConductLunarOrbitCheckouts;
			then action prepareLMforUndocking : PrepareLMforUndocking;
			then action performLMUndocking : PerformLMUndocking;
			then done;
		}
	}
	state def PoweredDescentPhase :> Phase {
		do action poweredDescentOperations {
			first start;
			then action executePoweredDescentBurn : ExecutePoweredDescentBurn;
			then action monitorDescentTelemetry : MonitorDescentTelemetry;
			then action performManualPiloting : PerformManualPiloting;
			then done;
		}
	}
	state def LunarSurfaceOperationsPhase :> Phase {
		do action lunarSurfaceOpsOperations {
			first start;
			then action conductLMPostLandingChecks : ConductLMPostLandingChecks;
			then action prepareForEVA : PrepareForEVA;
			then action performLunarEVA : PerformLunarEVA;
			then action collectLunarSamples : CollectLunarSamples;
			then action deployScientificInstruments : DeployScientificInstruments;
			then action concludeEVA : ConcludeEVA;
			then action manageLunarSurfaceRestPeriod : ManageLunarSurfaceRestPeriod;
			then done;
		}
	}
	state def LunarAscentRendezvousPhase :> Phase {
		do action lunarAscentRendezvousOperations {
			first start;
			then action executeLunarAscentBurn : ExecuteLunarAscentBurn;
			then action performRendezvousManeuvers : PerformRendezvousManeuvers;
			then action conductLMCSMDocking : ConductLMCSMDocking;
			then action transferCrewAndSamples : TransferCrewAndSamples;
			then action jettisonLM : JettisonLM;
			then done;
		}
	}
	state def TransEarthInjectionPhase :> Phase {
		do action teiPhaseOperations {
			first start;
			then action executeTEIBurn : ExecuteTEIBurn;
			then done;
		}
	}
	state def TransEarthCoastPhase :> Phase {
		do action tecPhaseOperations {
			first start;
			then action monitorSpacecraftSystems : MonitorSpacecraftSystems;
			then action communicateWithMissionControl : CommunicateWithMissionControl;
			then action prepareCMforReentry : PrepareCMforReentry;
			then done;
		}
	}
	state def ReentryLandingPhase :> Phase {
		do action reentryLandingOperations {
			first start;
			then action separateModules : SeparateModules;
			then action guideReentryTrajectory : GuideReentryTrajectory;
			then action deployParachutes : DeployParachutes;
			then action conductSplashdownOperations : ConductSplashdownOperations;
			then done;
		}
	}
	state def RecoveryQuarantinePhase :> Phase {
		do action recoveryQuarantineOperations {
			first start;
			then action retrieveCrewAndCM : RetrieveCrewAndCM;
			then action initiateQuarantineProcedures : InitiateQuarantineProcedures;
			then action secureLunarSamples : SecureLunarSamples;
			then done;
		}
	}

	// Special states
	state def Initial;
	state def MissionComplete;

}