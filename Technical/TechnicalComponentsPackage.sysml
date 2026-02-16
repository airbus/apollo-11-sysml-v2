//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package TechnicalComponentsPackage {

	private import CoSMAPackage::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import ShapeItems::*;
	private import SI::*;
	private import LogicalComponentsPackage::*;
	private import TechnicalPortsPackage::*;

	abstract part def PropelledSpacecraft :> FuelledComponent {
		attribute maxThrust :> ISQ::force;
		attribute specificImpulse :> specificImpulse;
	}

	abstract part def FuelledComponent :> HardwareComponent {
		attribute propellantMass :> ISQ::mass;
		attribute dryMass :> ISQ::mass;
	}

	abstract part def RocketEngine :> HardwareComponent {
		doc /* An abstract representation of a rocket engine, defining its core performance attributes. */
		attribute thrustVacuum :> ISQ::force;
		attribute specificImpulseVacuum :> specificImpulse;
	}

	abstract part def RocketStage :> FuelledComponent {
		doc /* An abstract representation of a single stage of a rocket, containing engines and propellant. */
		part engines[1..*] ordered : RocketEngine;
	}

	abstract part def MultistageRocket :> System {
		doc /* An abstract representation of a rocket composed of multiple stages. */
		part stages[1..*] ordered : RocketStage;
	}

	part def SaturnVInstrumentUnit :> HardwareComponent, PowerConsumer {
		doc /* The 'brain' of the Saturn V, providing guidance and control during ascent. */
		attribute dryMass :> ISQ::mass = 1950 [kg];
		attribute :>> failureRate = 5E-6 [1/h];
		attribute :>> powerLoad = 450 [W];
		
		port stageControlPort : ControlPort;
		port payloadInterfacePort : PayloadInterfacePort;
	}

	part def ApolloLaunchEscapeSystem :> HardwareComponent, PowerConsumer  {
		doc /* A solid-fueled rocket tower mounted atop the Command Module to pull it away from the launch vehicle in an emergency. */
		attribute :>> mass = 4170 [kg];
		attribute :>> powerLoad = 50 [W];
		attribute :>> failureRate = 1E-7 [1/h];
		
		port cmInterfacePort : ~LaunchEscapeSystemPort;
	}

	part def ApolloCommandModule :> HardwareComponent, PowerConsumer {
		doc /* The conical crew cabin, control center, and reentry vehicle. */
		attribute :>> mass = 5840 [kg];
		attribute :>> powerLoad = 2000 [W];
		attribute :>> failureRate = 1.5E-6 [1/h];
		
		port umbilicalPort : ~UmbilicalPort;
		port dockingPort : DockingPort;	
		port lesInterfacePort : LaunchEscapeSystemPort;
	}

	part def ApolloServiceModule :> PropelledSpacecraft, PowerConsumer, PowerProvider {
		doc /* The primary support module for the Command Module, containing the main engine, power systems, and consumables. */
		attribute :>> dryMass = 6160 [kg];
		attribute :>> propellantMass = 18440 [kg];
		attribute :>> maxThrust = 91 ['kN'];
		attribute :>> specificImpulse = 314 ['s'];
		attribute :>> powerGenerated = 3000 [W];
		attribute :>> powerLoad = 500 [W];
		attribute :>> failureRate = 2.0E-6 [1/h];		
		
		port umbilicalPort : UmbilicalPort;
		port launchVehicleInterfacePort : ~StagingPort;
	}

	part def ApolloCommandServiceModule :> CompositeThing, PowerConsumer, PowerProvider {
		doc /* The combined Command and Service Module (CSM), which functions as the primary spacecraft for lunar transit and Earth return. */
		part commandModule : ApolloCommandModule;
		part serviceModule : ApolloServiceModule;
		
		attribute :>> powerGenerated = serviceModule.powerGenerated;
		attribute :>> powerLoad = commandModule.powerLoad + serviceModule.powerLoad;
		
		interface cmSMUmbilical : CSMInterface connect serviceModule.umbilicalPort to commandModule.umbilicalPort;
	}

	part def ApolloLunarModule :> CompositeThing, PowerConsumer, PowerProvider {
		doc /* The two-stage vehicle that performed the lunar landing and ascent. */
		
		part lunarModuleDescentStage : LunarModuleDescentStage;
		part lunarModuleAscentStage : LunarModuleAscentStage;
		
		attribute :>> powerGenerated = lunarModuleDescentStage.powerGenerated + lunarModuleAscentStage.powerGenerated;
		attribute :>> powerLoad = lunarModuleDescentStage.powerLoad + lunarModuleAscentStage.powerLoad;
		
		interface lmInterstage : LMStagingInterface connect lunarModuleDescentStage.upperStagePort to lunarModuleAscentStage.lowerStagePort;
	}

	part def LunarModuleDescentStage :> PropelledSpacecraft, PowerConsumer, PowerProvider {
		doc /* The lower portion of the Lunar Module, used for the powered landing and as a launch platform for the ascent stage. */
		attribute :>> dryMass = 2100 [kg];
		attribute :>> propellantMass = 8250 [kg];
		attribute :>> maxThrust = 45 ['kN'];
		attribute :>> specificImpulse = 305 ['s'];
		attribute :>> powerGenerated = 1500 [W];
		attribute :>> powerLoad = 1000 [W];
		attribute :>> failureRate = 3.0E-6 [1/h];		
		
		port upperStagePort : LMStagingPort;
	}

	part def LunarModuleAscentStage :> PropelledSpacecraft, PowerConsumer, PowerProvider {
		doc /* The upper portion of the Lunar Module, which served as the crew cabin and ascent vehicle to leave the lunar surface. */
		attribute :>> dryMass = 2220 [kg];
		attribute :>> propellantMass = 2370 [kg];
		attribute :>> maxThrust = 16 ['kN'];
		attribute :>> specificImpulse = 311 ['s'];
		attribute :>> powerGenerated = 1500 [W];
		attribute :>> powerLoad = 1200 [W];
		attribute :>> failureRate = 2.5E-6 [1/h];		
		
		port lowerStagePort : ~LMStagingPort;
		port dockingPort : DockingPort;
	}

	part def ApolloSpacecraftLMAdapter :> HardwareComponent {
		doc /* A conical structure that housed the Lunar Module during launch and connected the Apollo spacecraft to the Saturn V. */
		attribute :>> mass = 1840 [kg];
		
		port launchVehicleInterfacePort : ~PayloadInterfacePort;
		port csmInterfacePort : StagingPort;
	}

	part def ApolloSpacecraft :> System, Spacecraft {
		doc /* The complete payload stack for the Apollo mission, including the CSM, LM, SLA, and Launch Escape System. */
		part launchEscapeSystem : ApolloLaunchEscapeSystem;
		part commandServiceModule : ApolloCommandServiceModule;
		part lunarModule : ApolloLunarModule;
		part spacecraftLMAdapter : ApolloSpacecraftLMAdapter;

		interface cmLMDocking : DockingInterface connect commandServiceModule.commandModule.dockingPort to  lunarModule.lunarModuleAscentStage.dockingPort;
		
		interface : StagingInterface connect spacecraftLMAdapter.csmInterfacePort to commandServiceModule.serviceModule.launchVehicleInterfacePort;
		interface lesConnection : LESInterface connect commandServiceModule.commandModule.lesInterfacePort to launchEscapeSystem.cmInterfacePort;
	}

	part def SaturnV :> MultistageRocket, LaunchSystem {
		doc /* The three-stage, super heavy-lift launch vehicle used to send the Apollo spacecraft to the Moon. */
		attribute height :> ISQ::length = 110.6 [m];
		attribute launchMass :> ISQ::mass = 2970000 [kg];
		attribute payloadToLunarTransferOrbit :> ISQ::mass = 43500 [kg];
	   
		part stage1 : 'S-IC';
		part stage2 : 'S-II';
		part stage3 : 'S-IVB';
		part instrumentUnit : SaturnVInstrumentUnit;
		part :>> stages[3] = (stage1, stage2, stage3);

		interface stage1ToStage2 : StagingInterface connect stage1.upperStagePort to stage2.lowerStagePort;
		interface stage2ToStage3 : StagingInterface connect stage2.upperStagePort to  stage3.lowerStagePort;
		interface iuToStage3 : GuidanceInterface connect instrumentUnit.stageControlPort to stage3.controlPort;
	}

	part def 'F-1' :> RocketEngine {
		doc /* A single-chamber liquid-propellant rocket engine, the most powerful ever built, used in the S-IC first stage. */
		attribute thrustSeaLevel :> ISQ::force = 6770 ['kN'];
		attribute :>> thrustVacuum = 7770 ['kN'];
		attribute :>> specificImpulseVacuum = 304 ['s'];
	}

	part def 'J-2' :> RocketEngine {
		doc /* A liquid-fuel cryogenic rocket engine used in the S-II and S-IVB stages, notable for its restart capability. */
		attribute :>> thrustVacuum = 1033 ['kN'];
		attribute :>> specificImpulseVacuum = 421 ['s'];
	}

	part def 'S-IVB' :> RocketStage {
		doc /* The third stage of the Saturn V, responsible for the final push into Earth orbit and the critical Translunar Injection burn. */
		attribute :>> propellantMass = 109500 [kg];
		attribute :>> dryMass = 13500 [kg];
		
		port lowerStagePort : ~StagingPort;
		port controlPort : ~ControlPort;        
		
		part engine : 'J-2';
		part :>> engines[1] = (engine);
	}

	part def 'S-II' :> RocketStage {
		doc /* The second stage of the Saturn V, providing massive thrust in the upper atmosphere and vacuum of space. */
		attribute :>> propellantMass = 443000 [SI::kg];
		attribute :>> dryMass = 36200 [kg];
		
		port lowerStagePort : ~StagingPort;
		port upperStagePort : StagingPort;
		
		part engine1 : 'J-2';
		part engine2 : 'J-2';
		part engine3 : 'J-2';
		part engine4 : 'J-2';
		part engine5 : 'J-2';
		part :>> engines[5] = (engine1, engine2, engine3, engine4, engine5);
	}

	part def 'S-IC' :> RocketStage {
		doc /* The first stage of the Saturn V, providing the initial ~7.7 million pounds of thrust for liftoff. */
		attribute :>> propellantMass = 2077000 [kg];
		attribute :>> dryMass = 137000 [kg];
	   
		port upperStagePort : StagingPort;
		
		part engine1 : 'F-1';
		part engine2 : 'F-1';
		part engine3 : 'F-1';
		part engine4 : 'F-1';
		part engine5 : 'F-1';
		part :>> engines[5] = (engine1, engine2, engine3, engine4, engine5);
	}

	part def ExtravehicularMobilityUnit :> System, EVASystem {
		doc /* The 'A7L' spacesuit, a self-contained personal spacecraft providing life support for lunar EVAs. */
		attribute massOnEarth :> ISQ::mass = 83 [kg];
		attribute nominalOperatingPressure :> ISQ::pressure = 25.5 ['kPa'];
		attribute lifeSupportDuration :> ISQ::time = 7 ['h'];
		
		part psa: PressureSuiteAssembly;
		part plss: PortableLifeSupportSystem;
		
		interface suitToPLSSUmbilical : EVAInterface connect plss.umbilicalPort to psa.umbilicalPort;
	}

	part def PressureSuiteAssembly :> HardwareComponent {
		doc /* The main suit portion, providing pressure and mobility. */
		port umbilicalPort : ~EVAUmbilicalPort;
	}

	part def PortableLifeSupportSystem :> HardwareComponent {
		doc /* The 'backpack' containing oxygen, CO2 scrubbers, cooling water, and communications equipment. */
		port umbilicalPort : EVAUmbilicalPort;
	}	
}