//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package ContextPackage {

	private import SI::*;
	private import ISQ::*;
	private import ScalarValues::*;
	private import CoSMAPackage::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import USCustomaryUnits::*;
	private import LogicalComponentsPackage::*;

	part def EarthEnvironment {
		doc /* The starting and ending physical environment for the mission. */
		attribute surfaceGravity :> ISQ::acceleration = 1 [gn];
		attribute standardAtmosphericPressure :> ISQ::pressure = 101325 [pascal];
		attribute rotationalVelocity :> ISQ::speed = 465 [m/s]; // At the equator
		attribute reentryInterfaceAltitude :> ISQ::length = 122 ['km'];
	}

	part def CislunarSpaceEnvironment {
		doc /* The physical environment between Earth and the Moon. */
		attribute ambientPressure :> ISQ::pressure = 3.2E-14 [pascal]; // Approximate pressure of interplanetary space
		attribute solarIrradiance :> ISQ::irradiance = 1361 [W/m^2];
		attribute backgroundTemperature :> ISQ::thermodynamicTemperature = 2.7 [K];
	}

	part def LunarEnvironment {
		doc /* The destination physical environment. */
		attribute surfaceGravity :> ISQ::acceleration = 1.62 ['m⋅s⁻²'];
		attribute surfacePressure :> ISQ::pressure = 3E-10 [pascal]; // Near-perfect vacuum
		attribute maxDayTemperature :> ISQ::thermodynamicTemperature = 400 [K];  // Approx. 127 °C
		attribute minNightTemperature :> ISQ::thermodynamicTemperature = 100 [K];  // Approx. -173 °C
	}	

	part def LaunchSite :> System, GroundSupportSystem {
		doc /* The specific ground facility from which the mission originates. */
		attribute name: String = "John F. Kennedy Space Center";
		attribute location: String = "Merritt Island, Florida, USA";
		attribute geographicCoordinates: String = "28.57° N, 80.65° W";
		
		part vehicleAssemblyBuilding : VehicleAssemblyBuilding;
		part launchControlCenter : LaunchControlCenter;
		part crawlerTransporter : CrawlerTransporter;
	}

	part def VehicleAssemblyBuilding :> System, GroundSupportSystem {
		doc /* The massive facility used to stack the space vehicle. */
	}

	part def LaunchControlCenter :> System, GroundSupportSystem {
		doc /* The facility for controlling the pre-launch and launch sequences. */
	}

	part def CrawlerTransporter :> System, GroundSupportSystem {
		doc /* The mobile platform used to move the rocket from the VAB to the launch pad. */
	}

	part def MissionControl :> System, GroundSupportSystem {
		doc /* The Earth-based command, control, and analysis center for post-launch operations. */
		attribute location: String = "Houston, Texas";
	}

	part def RecoveryForces :> System, GroundSupportSystem {
		doc /* The assets tasked with retrieving the crew and capsule after splashdown. */  
	}

	part def MannedSpaceFlightNetwork :> System, DataTransmissionNetwork {
		doc /* The Manned Space Flight Network (abbreviated MSFN, pronounced "misfin") was a set of tracking stations built to support the American Mercury, Gemini, Apollo, and Skylab space programs. */    	
	}

	part def Apollo11MissionContext :> Context {
		part vehicleAssemblyBuilding : VehicleAssemblyBuilding :> externalSystems;
		part launchControlCenter : LaunchControlCenter :> externalSystems;
		part crawlerTransporter : CrawlerTransporter :> externalSystems;
		part missionControl : MissionControl :> externalSystems;
		part recoveryForces : RecoveryForces :> externalSystems;
		part mannedSpaceFlightNetwork : MannedSpaceFlightNetwork :> externalSystems;
	}
}