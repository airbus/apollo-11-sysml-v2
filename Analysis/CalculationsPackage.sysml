//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package CalculationsPackage {
	
	private import ISQ::*;
	private import ScalarValues::*;
	private import CoSMAPackage::*;
	private import ScalarFunctions::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import TechnicalComponentsPackage::*;
	private import NumericalFunctions::*;
	private import CollectionFunctions::*;
	private import ControlFunctions::*;
	private import NumericalFunctions::*;
	private import Parts::*;	
	
	calc def rollupPowerGeneration  {
		in system: System;
		return :> ISQ::power = system.subparts->select {
			in sys : Part;
			sys istype PowerProvider 
		}
		->collect {
			in sys : PowerProvider;
			sys.powerGenerated
		}
		->sum();
	}
	
	calc def rollupPowerConsumption  {
		in system: System;
		return :> ISQ::power = system.subparts->select {
			in sys : Part;
			sys istype PowerConsumer 
		}
		->collect {
			in sys : PowerConsumer;
			sys.powerLoad
		}
		->sum();
	}	
	
	
	calc def calculateTliDeltaV {
		doc /* Calculates the required Delta-V for a Hohmann-like Translunar Injection. */
		in mu_Earth :> ISQ::force;
		in r_leo :> ISQ::length;
		in r_apoapsis :> ISQ::length;
		return deltaV :> ISQ::speed = (mu_Earth * (2/r_leo - 2/(r_leo + r_apoapsis)))^(1/2) - (mu_Earth / r_leo)^(1/2);
	}

	calc def calculateLoiDeltaV {
		doc /* Calculates the required braking Delta-V for Lunar Orbit Insertion from a hyperbolic approach. */
		in v_inf :> ISQ::speed;
		in mu_Moon :> ISQ::force;
		in r_periapsis :> ISQ::length;
		return deltaV :> ISQ::speed = (v_inf^2 + 2*mu_Moon/r_periapsis)^(1/2) - (mu_Moon/r_periapsis)^(1/2);
	}

	calc def sumCosts {
		doc /* Sums the major cost categories to find the total program cost. */
		in r_d :> currency;
		in mfg :> currency;
		in ops :> currency;
		in personnel :> currency;
		return total :> currency = r_d + mfg + ops + personnel;
	}

	calc def calculateReliability {
		doc /* Calculates the reliability of a component over time using the exponential failure distribution. */
		in failureRate :> ISQ::frequency;
		in missionTime :> ISQ::duration;
		return reliability : RatioValue = eulerNumber^(-(failureRate * missionTime));
	}
	
	calc def evaluateMissionSuccess {
		doc /* Evaluates the overall mission success based on the achievement of primary objectives. */
		in crewSafe : Boolean;
		in landed : Boolean;
		in samplesReturned : Boolean;
		in instrumentsDeployed : Boolean;
		return isSuccess : Boolean = crewSafe and landed and samplesReturned and instrumentsDeployed;
	}

	calc def calculateMassBudgetStep {
		doc /* Calculates the remaining mass of a vehicle after a mission event. */
		in initialMass :> ISQ::mass;
		in propellantUsed :> ISQ::mass;
		in jettisonedMass :> ISQ::mass;
		return finalMass :> ISQ::mass = initialMass - propellantUsed - jettisonedMass;
	}
	
	calc def calculatePowerMargin {
		doc /* Calculates the difference between available power and the sum of all electrical loads. */
		in sourcePower :> ISQ::power;
		in totalLoadPower :> ISQ::power;
		return powerMargin :> ISQ::power = sourcePower - totalLoadPower;
	}

	calc def calculateDeltaV {
		doc /* Calculates the maximum change in velocity a stage can provide using the Tsiolkovsky Rocket Equation. */
		in isp :> specificImpulse;
		in g0 :> ISQ::acceleration;
		in m0 :> ISQ::mass;
		in mf :> ISQ::mass;
		return deltaV :> ISQ::speed = isp * g0 * ln(m0 / mf);
	}
	
	calc def calculateLaunchStageDeltaV {
		doc /* Calculates the delta-v provided by a launch stage (like S-IC or S-II) carrying an upper stack. */
		in stage: RocketStage;
		in payloadStack: HardwareComponent[*];
		
		payloadMass = sumGrossMass(payloadStack);
		initialMass = stage.dryMass + stage.propellantMass + payloadMass;
		finalMass = stage.dryMass + payloadMass;
		isp = stage.engines.specificImpulseVacuum;
		
		return deltaV :> ISQ::speed = calculateDeltaV(isp, initialMass, finalMass);
	}

	calc def calculateSpacecraftBurnDeltaV {
		doc /* Calculates the delta-v provided by a self-propelled spacecraft (CSM or LM stages). */
		in spacecraft: PropelledSpacecraft;

		initialMass = spacecraft.dryMass + spacecraft.propellantMass;
		finalMass = spacecraft.dryMass;
		isp = spacecraft.specificImpulse;
		
		return deltaV :> ISQ::speed = calculateDeltaV(isp, initialMass, finalMass);
	}
	
	calc def sumGrossMass {
		doc /* A utility to sum the gross (fully fueled) mass of a set of components. */
		in components: HardwareComponent[*];
		return totalMass :> ISQ::mass = sum(components.totalMass);
	}
	
	calc def sumDryMass {
		doc /* A utility to sum the dry mass of a set of components. */
		in components: FuelledComponent[*];
		return totalMass :> ISQ::mass = sum(components.dryMass);
	}
}