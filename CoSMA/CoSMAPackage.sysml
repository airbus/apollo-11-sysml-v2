//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

library package CoSMAPackage {

	private import NumericalFunctions::*;
	private import States::*;
	private import ISQ::*;
	private import SI::*;
	private import MeasurementReferences::*;
	private import Quantities::*;
	private import Base::DataValue;
	private import Metaobjects::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	
	part def MassedThing {
		attribute mass :> ISQ::mass; 
		attribute totalMass :> ISQ::mass;
	}
	
	part def SimpleThing :> MassedThing {
		attribute redefines totalMass = mass;
	}
	
	part def CompositeThing :> MassedThing {
		part subcomponents: MassedThing[*];
		:>> totalMass = mass + sum(subcomponents.totalMass); 
	}

	abstract action def Operation;
	
	abstract action def Function {
		action subfunctions[*] : Function :>> subactions;
	}

	abstract part def SystemOfInterest;
	abstract part def LogicalComponent;

	abstract part def TechnicalComponent {
		attribute failureRate :> ISQ::frequency;
	}

	abstract part def SoftwareComponent :> TechnicalComponent;
	abstract part def HardwareComponent :> TechnicalComponent, SimpleThing;

	abstract part def PowerProvider :> HardwareComponent {
		attribute powerGenerated :> ISQ::power = 0 [W];	
	}

	abstract part def PowerConsumer :> HardwareComponent {
		attribute powerLoad :> ISQ::power;	
	}
	
	part def Program {
		part missions[1..*] : Mission;
	}

	state def Phase :> StateAction;

	part def Capability;

	part def Astronaut :> Person;

	abstract part def MannedSpaceMission :> Mission {
		part crew[1..*] : Astronaut;
	}

	abstract part def Mission {
		requirement goals[1..*] : Goal;
		part system : System;
		part context : Context;
		exhibit state phases : StateAction;
		part requiredCapabilites[0..*];
		abstract connection capabilityToGoals[*] : CapabilityToGoalDerivation;
		attribute plannedDuration :> ISQ::duration;

		attribute researchAndDevelopmentCost :> currency;
		attribute manufacturingCost :> currency;
		attribute operationsCost :> currency;
		attribute personnelCost :> currency;		
	}

	abstract connection def CapabilityToGoalDerivation {
		ref part capability[1] : Capability :> participant; 
		ref requirement goals[1..*] : Goal :> participant; 
	}

	requirement def Goal;

	item def Concern;

	enum def StakeholderInfluenceKind {
		enum direct;
		enum indirect;
	}

	enum def StakeholderInfluenceLevel {
		enum high;
		enum medium;
		enum low;
	}	

	part def Person;

	requirement def StakeholderNeed;

	part def Stakeholder {
		attribute influenceLevel: StakeholderInfluenceLevel;
		attribute influenceKind: StakeholderInfluenceKind;
		item concerns[*]: Concern;
		requirement needs[*]: StakeholderNeed;
	}
	
	part def Context :> System {
		part externalSystems[*] : System;
	}
	
	part def System :> CompositeThing {
		
	}
	
	part def SystemOfSystems :> System {
		part constituentSystems[*] : ConstituentSystem;
	}
	
	part def ConstituentSystem :> System {
		
	}

}