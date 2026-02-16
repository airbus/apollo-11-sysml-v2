//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package SystemSpecificationPackage {
	
	private import TechnicalRequirementsPackage::**;
	private import SystemPackage::*;
	
	requirement apollo11MissionSystemSpecification {
		doc /* Apollo 11 System requirements group */
		subject apollo11MissionSystem : Apollo11MissionSystem;
		
		requirement 'clr-R001' : SICEngineConfiguration;
		requirement 'clr-R002' : SICPropellantCompatibility;
		requirement 'clr-R003' : SICGimbalCapability;
		requirement 'clr-R026' : SICSeparationSystem;
		requirement 'clr-R004' : SIIEngineConfiguration;
		requirement 'clr-R005' : SIIPropellantType;
		requirement 'clr-R027' : SIIStructuralIntegrity;
		requirement 'clr-R006' : SIVBEngineConfiguration;
		requirement 'clr-R007' : SIVBRestartCapability;
		requirement 'clr-R028' : SIVBAttitudeControlSystem;
		requirement 'clr-R008' : IUGuidanceComputer;
		requirement 'clr-R009' : IUCommandAuthority;
		requirement 'clr-R029' : IUTelemetrySystem;
		requirement 'clr-R010' : LESPropulsionType;
		requirement 'clr-R011' : LESJettisonCapability;
		requirement 'clr-R012' : CMHabitableVolume;
		requirement 'clr-R013' : CMHeatShield;
		requirement 'clr-R014' : CMParachuteSystem;
		requirement 'clr-R030' : CMDockingMechanism;
		requirement 'clr-R015' : SMMainPropulsion;
		requirement 'clr-R016' : SMAttitudeControl;
		requirement 'clr-R017' : SMPowerGeneration;
		requirement 'clr-R031' : SMThermalControlSystem;
		requirement 'clr-R018' : LMDSThrottleableEngine;
		requirement 'clr-R019' : LMDSLandingGear;
		requirement 'clr-R032' : LMDSLaunchPlatform;
		requirement 'clr-R020' : LMASAscentEngine;
		requirement 'clr-R021' : LMASCrewCabin;
		requirement 'clr-R033' : LMASRendezvousRadar;
		requirement 'clr-R022' : PSAPressureContainment;
		requirement 'clr-R023' : PSAMobility;
		requirement 'clr-R034' : PSAHelmetVisibility;
		requirement 'clr-R024' : PLSSOxygenSupply;
		requirement 'clr-R025' : PLSSContaminantRemoval;
		requirement 'clr-R035' : PLSSCoolingSystem;
		requirement 'clr-R036' : StagingInterfaceLoadTransfer;
		requirement 'clr-R037' : StagingInterfaceCleanSeparation;
		requirement 'clr-R038' : GuidanceInterfaceCommandIntegrity;
		requirement 'clr-R039' : GuidanceInterfaceTelemetryLatency;
		requirement 'clr-R040' : CSMInterfacePowerTransfer;
		requirement 'clr-R041' : CSMInterfaceLifeSupportIntegrity;
		requirement 'clr-R042' : DockingInterfaceStructuralRigidity;
		requirement 'clr-R043' : DockingInterfacePressurizedSeal;
		requirement 'clr-R044' : LMStagingInterfaceSeparation;
		requirement 'clr-R045' : EVAInterfaceSecureConnection;
		requirement 'clr-R046' : LVPayloadInterfaceStructural;
		requirement 'clr-R047' : SLALMDeployment;
		requirement 'clr-R048' : LESInterfaceStructuralIntegrity;
		requirement 'clr-R049' : LESInterfaceCommandReliability;
		requirement 'clr-R050' : LMDSVelocityLimits;	
		requirement 'clr-R051' : CabinEnvironmentalControlRequirement;
		requirement 'clr-R052' : GNCGuidancePrecision;
		requirement 'clr-R053' : RCSControlStability;
		requirement 'clr-R054' : LMDSRadarPrecision;
		requirement 'clr-R056' : SPSIgnitionReliability;
		requirement 'clr-R057' : DPSThrottlingRange;
		requirement 'clr-R058' : LMASBurnDuration;
		requirement 'clr-R060' : CMHeatShieldThermalPerf;
		requirement 'clr-R067' : CommVideoBandwidth;
		requirement 'clr-R068' : EMUPressureContainment;
		requirement 'clr-R069' : EASEPOperationalDuration;
		requirement 'clr-R071' : FlightSoftwareDefectRate;
		requirement 'clr-R073' : MaterialVacuumResistance;
		requirement 'clr-R075' : ImageResolutionStandard;
		requirement 'clr-R076' : WasteStorageVolume;
		requirement 'clr-R077' : VHFAudioBandwidth;
		requirement 'clr-R078' : SystemRedundancyMapping;
		requirement 'clr-R079' : MedicalKitSpecification;
		requirement 'clr-R080' : GroundArchivalProtocol;
		requirement 'clr-R081' : CrewSeatLoadFactor;
		requirement 'clr-R082' : LaunchAbortThresholds;
		requirement 'clr-R083' : SeparationTimerPrecision;
		requirement 'clr-R084' : CabinPressureHold;
		requirement 'clr-R085' : TimingSynchError;
		requirement 'clr-R086' : EngineStartLatency;
		requirement 'clr-R087' : StagingShockLimit;
		requirement 'clr-R088' : CutoffDeltaVError;
		requirement 'clr-R089' : CockpitDisplayRefresh;
		requirement 'clr-R090' : TelemetrySamplingRate;
		requirement 'clr-R091' : PostTliSeparationVelocity;
		requirement 'clr-R092' : SlaSeparationVelocity;
		requirement 'clr-R093' : TranspositionManeuverRate;
		requirement 'clr-R094' : SextantAngularAccuracy;
		requirement 'clr-R095' : StateVectorIntegrationLatency;
		requirement 'clr-R096' : CommandTurnaroundLatency;
		requirement 'clr-R097' : GroundStationSensitivity;
		requirement 'clr-R098' : RelayNetworkBitErrorRate;
		requirement 'clr-R099' : TimelineDriftAlert;
		requirement 'clr-R100' : SleepAcousticLimit;
		requirement 'clr-R101' : TargetOrbitPerigee;
		requirement 'clr-R102' : HatchClearanceDimensions;
		requirement 'clr-R103' : LmComputerAlignmentTime;
		requirement 'clr-R104' : DockingLatchTorqueThreshold;
		requirement 'clr-R105' : UndockingSeparationVelocity;
		requirement 'clr-R106' : DskyDisplayBrightness;
		requirement 'clr-R107' : LandingRadarLockTime;
		requirement 'clr-R108' : PostLandingSafeTime;
		requirement 'clr-R109' : LmCabinIntegrityLeakRate;
		requirement 'clr-R110' : SymbolicMountRigidity;
		requirement 'clr-R111' : SampleToolMechanicalAdvantage;
		requirement 'clr-R112' : EasepThermalInsulation;
		requirement 'clr-R113' : EvaCommunicationRange;
		requirement 'clr-R114' : SurfaceTimelineSync;
		requirement 'clr-R115' : LmAscentDeltaVMinimum;
		requirement 'clr-R116' : RendezvousOrbitTarget;
		requirement 'clr-R117' : ReentryFlightPathAngle;			
		
		satisfy 'clr-R001' by apollo11MissionSystem.launchVehicle.stage1;
		satisfy 'clr-R002' by apollo11MissionSystem.launchVehicle.stage1;
		satisfy 'clr-R003' by apollo11MissionSystem.launchVehicle.stage1;
		satisfy 'clr-R004' by apollo11MissionSystem.launchVehicle.stage2;
		satisfy 'clr-R005' by apollo11MissionSystem.launchVehicle.stage2;
		satisfy 'clr-R006' by apollo11MissionSystem.launchVehicle.stage3;
		satisfy 'clr-R007' by apollo11MissionSystem.launchVehicle.stage3;
		satisfy 'clr-R008' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R009' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R010' by apollo11MissionSystem.spacecraft.launchEscapeSystem;
		satisfy 'clr-R011' by apollo11MissionSystem.spacecraft.launchEscapeSystem;
		satisfy 'clr-R012' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R013' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R014' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R015' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R016' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R017' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R018' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R019' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R050' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R020' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R021' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R022' by apollo11MissionSystem.spaceSuits.psa;
		satisfy 'clr-R023' by apollo11MissionSystem.spaceSuits.psa;
		satisfy 'clr-R024' by apollo11MissionSystem.spaceSuits.plss;
		satisfy 'clr-R025' by apollo11MissionSystem.spaceSuits.plss;
		satisfy 'clr-R026' by apollo11MissionSystem.launchVehicle.stage1;
		satisfy 'clr-R027' by apollo11MissionSystem.launchVehicle.stage2;
		satisfy 'clr-R028' by apollo11MissionSystem.launchVehicle.stage3;
		satisfy 'clr-R029' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R030' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R031' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R032' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R033' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R034' by apollo11MissionSystem.spaceSuits.psa;
		satisfy 'clr-R035' by apollo11MissionSystem.spaceSuits.plss;
		satisfy 'clr-R036' by apollo11MissionSystem.launchVehicle.stage1ToStage2;
		satisfy 'clr-R036' by apollo11MissionSystem.launchVehicle.stage2ToStage3;
		satisfy 'clr-R037' by apollo11MissionSystem.launchVehicle.stage1ToStage2;
		satisfy 'clr-R037' by apollo11MissionSystem.launchVehicle.stage2ToStage3;
		satisfy 'clr-R038' by apollo11MissionSystem.launchVehicle.iuToStage3;
		satisfy 'clr-R039' by apollo11MissionSystem.launchVehicle.iuToStage3;
		satisfy 'clr-R040' by apollo11MissionSystem.spacecraft.csm.cmSMUmbilical;
		satisfy 'clr-R041' by apollo11MissionSystem.spacecraft.csm.cmSMUmbilical;
		satisfy 'clr-R042' by apollo11MissionSystem.spacecraft.cmLMDocking;
		satisfy 'clr-R043' by apollo11MissionSystem.spacecraft.cmLMDocking;
		satisfy 'clr-R044' by apollo11MissionSystem.spacecraft.lm.lmInterstage;
		satisfy 'clr-R045' by apollo11MissionSystem.spaceSuits.suitToPLSSUmbilical;	
		satisfy 'clr-R046' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R046' by apollo11MissionSystem.spacecraft.spacecraftLMAdapter;
		satisfy 'clr-R047' by apollo11MissionSystem.spacecraft.spacecraftLMAdapter;
		satisfy 'clr-R048' by apollo11MissionSystem.spacecraft.lesConnection;
		satisfy 'clr-R049' by apollo11MissionSystem.spacecraft.lesConnection;				
		satisfy 'clr-R050' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;		

		satisfy 'clr-R086' by apollo11MissionSystem.launchVehicle.stage1;
		satisfy 'clr-R087' by apollo11MissionSystem.launchVehicle.stage2;
		satisfy 'clr-R088' by apollo11MissionSystem.launchVehicle.stage3;
		satisfy 'clr-R091' by apollo11MissionSystem.launchVehicle.stage3;
		
		satisfy 'clr-R008' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R052' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R071' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R082' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R085' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R090' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R094' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R095' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R114' by apollo11MissionSystem.launchVehicle.instrumentUnit;

		satisfy 'clr-R051' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R060' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R075' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R076' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R079' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R081' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R084' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R089' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R099' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R100' by apollo11MissionSystem.spacecraft.csm.commandModule;
		satisfy 'clr-R117' by apollo11MissionSystem.spacecraft.csm.commandModule;

		satisfy 'clr-R053' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R056' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R073' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R078' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R093' by apollo11MissionSystem.spacecraft.csm.serviceModule;
		satisfy 'clr-R101' by apollo11MissionSystem.spacecraft.csm.serviceModule;

		satisfy 'clr-R054' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R057' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R069' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R107' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R108' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;
		satisfy 'clr-R112' by apollo11MissionSystem.spacecraft.lm.lunarModuleDescentStage;

		satisfy 'clr-R058' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R067' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R102' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R103' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R106' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R109' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R115' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;
		satisfy 'clr-R116' by apollo11MissionSystem.spacecraft.lm.lunarModuleAscentStage;

		satisfy 'clr-R068' by apollo11MissionSystem.spaceSuits.psa;
		satisfy 'clr-R110' by apollo11MissionSystem.spaceSuits.psa;
		satisfy 'clr-R111' by apollo11MissionSystem.spaceSuits.psa;
		satisfy 'clr-R113' by apollo11MissionSystem.spaceSuits.psa;
		satisfy 'clr-R024' by apollo11MissionSystem.spaceSuits.plss;
		satisfy 'clr-R025' by apollo11MissionSystem.spaceSuits.plss;
		satisfy 'clr-R035' by apollo11MissionSystem.spaceSuits.plss;


		satisfy 'clr-R113' by apollo11MissionSystem.spacecraft.cmLMDocking;
		satisfy 'clr-R092' by apollo11MissionSystem.spacecraft.spacecraftLMAdapter;
		satisfy 'clr-R083' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R096' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R097' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R098' by apollo11MissionSystem.launchVehicle.instrumentUnit;
		satisfy 'clr-R080' by apollo11MissionSystem.launchVehicle.instrumentUnit;		
		
	}
}