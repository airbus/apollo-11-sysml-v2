//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package MissionSpecificationPackage {
	
	private import MissionRequirementsPackage::*;
	private import MissionPackage::*;
	private import OperationsPackage::*;
	
	requirement apollo11MissionSpecification {
		doc /* Apollo 11 Mission requirements group */
		subject apollo11Mission : Apollo11Mission;
		
		requirement 'hlr-R001' : CrewReturnSafetyRequirement;
		requirement 'hlr-R002' : LunarLanderSoftLandingRequirement;
		requirement 'hlr-R003' : TransLunarInjectionAccuracyRequirement;
		requirement 'hlr-R004' : CommunicationUptimeRequirement;
		requirement 'hlr-R006' : LunarSampleCollectionQuantityRequirement;
		requirement 'hlr-R007' : ScientificInstrumentDeploymentRequirement;
		requirement 'hlr-R008' : LunarVisualDocumentationRequirement;
		requirement 'hlr-R009' : NationalSymbolDeploymentRequirement;
		requirement 'hlr-R010' : PlanetaryProtectionQuarantineRequirement;
		requirement 'hlr-R026' : WasteManagementEffectiveness;
		requirement 'hlr-R028' : CrewSleepEnvironmentQuality;
		requirement 'hlr-R030' : CrewAlarmResponseTime;
		requirement 'hlr-R032' : LunarLanderToOrbiterVoiceComm;
		requirement 'hlr-R033' : ExtravehicularMobilityUnitLifeSupportDuration;
		requirement 'hlr-R035' : ExtravehicularMobilityUnitDexterityForTasks;
		requirement 'hlr-R036' : LunarSurfaceMobilityRange;
		requirement 'hlr-R037' : ExtravehicularActivityToolSecurity;
		requirement 'hlr-R038' : SamplePristinePreservation;
		requirement 'hlr-R040' : SampleGeologicalContext;
		requirement 'hlr-R045' : CriticalComponentRedundancy;
		requirement 'hlr-R046' : AbortSequenceExecutionTime;
		requirement 'hlr-R047' : ManualOverrideResponseTime;
		requirement 'hlr-R048' : GroundSegmentDataUpdateFrequency;
		requirement 'hlr-R049' : LunarLanderAscentReadinessTime;
		requirement 'hlr-R050' : FlightSoftwareUpdateTime;
		requirement 'hlr-R052' : CrewEmergencyMedicalProficiency;
		requirement 'hlr-R053' : InFlightProcedureErrorRate;
		requirement 'hlr-R054' : CrewNutritionAndHydration;
		requirement 'hlr-R055' : CrewPsychologicalState;
		requirement 'hlr-R057' : MicrometeoroidPenetrationRisk;
		requirement 'hlr-R059' : LunarElementEnvironmentalResistance;
		requirement 'hlr-R060' : PostFlightDataArchiving;

		requirement 'hlr-R005' : SustainedCabinHabitability;
		requirement 'hlr-R011' : TrajectoryNavigationPrecision;
		requirement 'hlr-R061' : PropulsionSystemMissionReliability;
		requirement 'hlr-R062' : MechanicalLoadResilience;
		requirement 'hlr-R063' : LiveVisualBroadcast;
		requirement 'hlr-R064' : ExtendedScientificOperation;
		requirement 'hlr-R065' : CriticalSystemAvailability;
		requirement 'hlr-R066' : PublicSupportAndAffairsManagement;
		requirement 'hlr-R067' : ElectricalPowerAvailability;
		requirement 'hlr-R068' : LaunchWindowPrecision;
		requirement 'hlr-R069' : OperationalWorkaroundProtocol;
		
		satisfy 'hlr-R001' by apollo11Mission.apollo11Phases.recoveryQuarantine.recoveryQuarantineOperations.retrieveCrewAndCM;
		satisfy 'hlr-R002' by apollo11Mission.apollo11Phases.poweredDescent.poweredDescentOperations.executePoweredDescentBurn;
		satisfy 'hlr-R003' by apollo11Mission.apollo11Phases.tli.tliPhaseOperations.executeTLIBurn;
		satisfy 'hlr-R004' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.communicateWithMissionControl;
		satisfy 'hlr-R006' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.collectLunarSamples;
		satisfy 'hlr-R007' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.deployScientificInstruments;
		satisfy 'hlr-R008' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.performLunarEVA;
		satisfy 'hlr-R009' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.performLunarEVA;
		satisfy 'hlr-R010' by apollo11Mission.apollo11Phases.recoveryQuarantine.recoveryQuarantineOperations.initiateQuarantineProcedures;
		satisfy 'hlr-R026' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R028' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.manageCrewRestPeriods;
		satisfy 'hlr-R030' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R032' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.performLunarEVA;
		satisfy 'hlr-R033' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.performLunarEVA;
		satisfy 'hlr-R035' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.performLunarEVA;
		satisfy 'hlr-R036' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.performLunarEVA;
		satisfy 'hlr-R037' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.performLunarEVA;
		satisfy 'hlr-R038' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.collectLunarSamples;
		satisfy 'hlr-R040' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.collectLunarSamples;
		satisfy 'hlr-R045' by apollo11Mission.apollo11Phases.loi.loiPhaseOperations.executeLOIBurn;
		satisfy 'hlr-R046' by apollo11Mission.apollo11Phases.launch.launchPhaseOperations.executeLaunchSequence;
		satisfy 'hlr-R047' by apollo11Mission.apollo11Phases.poweredDescent.poweredDescentOperations.performManualPiloting;
		satisfy 'hlr-R048' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.communicateWithMissionControl;
		satisfy 'hlr-R049' by apollo11Mission.apollo11Phases.lunarAscentRendezvous.lunarAscentRendezvousOperations.executeLunarAscentBurn;
		satisfy 'hlr-R050' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.communicateWithMissionControl;
		satisfy 'hlr-R052' by apollo11Mission.apollo11Phases.preparation.prepareForMissionPhaseOperations.transferCrewToVehicle;
		satisfy 'hlr-R053' by apollo11Mission.apollo11Phases.lunarAscentRendezvous.lunarAscentRendezvousOperations.conductLMCSMDocking;
		satisfy 'hlr-R054' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.manageCrewRestPeriods;
		satisfy 'hlr-R055' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.manageCrewRestPeriods;
		satisfy 'hlr-R057' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R059' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.deployScientificInstruments;
		satisfy 'hlr-R060' by apollo11Mission.apollo11Phases.recoveryQuarantine.recoveryQuarantineOperations;

		satisfy 'hlr-R005' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R005' by apollo11Mission.apollo11Phases.tec.tecPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R011' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.conductMidCourseCorrections;
		satisfy 'hlr-R061' by apollo11Mission.apollo11Phases.loi.loiPhaseOperations.executeLOIBurn;
		satisfy 'hlr-R062' by apollo11Mission.apollo11Phases.launch.launchPhaseOperations.executeLaunchSequence;
		satisfy 'hlr-R063' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.communicateWithMissionControl;
		satisfy 'hlr-R063' by apollo11Mission.apollo11Phases.tec.tecPhaseOperations.communicateWithMissionControl;
		satisfy 'hlr-R064' by apollo11Mission.apollo11Phases.lunarSurfaceOps.lunarSurfaceOpsOperations.deployScientificInstruments;
		satisfy 'hlr-R065' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R065' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R066' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.communicateWithMissionControl;
		satisfy 'hlr-R066' by apollo11Mission.apollo11Phases.tec.tecPhaseOperations.communicateWithMissionControl;
		satisfy 'hlr-R067' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R067' by apollo11Mission.apollo11Phases.tlc.tlcPhaseOperations.monitorSpacecraftSystems;
		satisfy 'hlr-R068' by apollo11Mission.apollo11Phases.launch.launchPhaseOperations.performPreLaunchCountdown;
		satisfy 'hlr-R069' by apollo11Mission.apollo11Phases.poweredDescent.poweredDescentOperations.performManualPiloting;
	}
}