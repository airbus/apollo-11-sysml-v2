//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package OperationsPackage {
	
	private import CoSMAPackage::*;

	action def LoadConsumablesAndPropellants :> Operation {
		doc /* The process of fueling the Saturn V rocket and loading all necessary consumables like oxygen and water into the spacecraft. */
	}
	action def TransferCrewToVehicle :> Operation {
		doc /* The operation where the flight crew moves from the crew quarters to the launch pad and ingresses the Command Module. */
	}

	action def PerformPreLaunchCountdown :> Operation {
		doc /* The synchronized sequence of checks and configurations performed in the final hours and minutes leading up to liftoff. */
	}
	action def ExecuteLaunchSequence :> Operation {
		doc /* The automated and monitored sequence of engine ignitions, vehicle ascent, and staging events that propel the vehicle into orbit. */
	}
	action def MonitorAscentTrajectory :> Operation {
		doc /* The continuous tracking of the vehicle's speed, altitude, and flight path during ascent to ensure it is following the correct trajectory. */
	}

	action def ExecuteTLIBurn :> Operation {
		doc /* The critical engine burn of the S-IVB third stage to propel the spacecraft out of Earth orbit and onto a trajectory to the Moon. */
	}
	action def PerformTranspositionDockingExtraction :> Operation {
		doc /* The complex maneuver where the CSM separates, turns around, docks with the LM, and extracts it from the S-IVB stage. */
	}
	action def ConductMidCourseCorrections :> Operation {
		doc /* Small propulsive burns performed during the coast phases to refine the spacecraft's trajectory. */
	}
	action def MonitorSpacecraftSystems :> Operation {
		doc /* The continuous monitoring of all onboard systems by the crew and Mission Control to ensure vehicle health. */
	}
	action def CommunicateWithMissionControl :> Operation {
		doc /* The two-way exchange of voice, telemetry, and command data between the spacecraft and ground stations. */
	}
	action def ManageCrewRestPeriods :> Operation {
		doc /* The scheduling and management of sleep, meals, and downtime for the crew to ensure their health and performance. */
	}

	action def ExecuteLOIBurn :> Operation {
		doc /* The engine burn of the Service Module to slow the spacecraft, allowing it to be captured into a stable lunar orbit. */
	}
	action def ConductLunarOrbitCheckouts :> Operation {
		doc /* A series of system health checks performed on the CSM and LM while in lunar orbit. */
	}
	action def PrepareLMforUndocking :> Operation {
		doc /* The process of activating the Lunar Module's systems and configuring it for independent flight. */
	}
	action def PerformLMUndocking :> Operation {
		doc /* The physical separation of the Lunar Module from the Command Module in lunar orbit. */
	}

	action def ExecutePoweredDescentBurn :> Operation {
		doc /* The continuous, throttleable engine burn of the LM Descent Stage to control the descent from orbit to the lunar surface. */
	}
	action def MonitorDescentTelemetry :> Operation {
		doc /* The real-time tracking of the LM's altitude and velocity during the landing phase. */
	}
	action def PerformManualPiloting :> Operation {
		doc /* The manual control of the LM by the Commander during the final phase of landing to avoid hazards. */
	}
	action def ConductLMPostLandingChecks :> Operation {
		doc /* A series of procedures performed after landing to safe the LM's systems and verify its integrity. */
	}
	action def PrepareForEVA :> Operation {
		doc /* The process of the crew donning their spacesuits and depressurizing the LM cabin for surface exploration. */
	}
	action def PerformLunarEVA :> Operation {
		doc /* The extravehicular activity where the crew operates on the lunar surface to explore and conduct experiments. */
	}
	action def CollectLunarSamples :> Operation {
		doc /* The task of gathering and storing rock and soil samples from the lunar surface. */
	}
	action def DeployScientificInstruments :> Operation {
		doc /* The setup of the Early Apollo Scientific Experiments Package (EASEP) on the lunar surface. */
	}
	action def ConcludeEVA :> Operation {
		doc /* The process of the crew re-entering the LM, stowing equipment, and closing the hatch. */
	}
	action def ManageLunarSurfaceRestPeriod :> Operation {
		doc /* The scheduled rest and sleep period for the crew while on the Moon. */
	}

	action def ExecuteLunarAscentBurn :> Operation {
		doc /* The firing of the LM Ascent Stage engine to lift off from the lunar surface and return to orbit. */
	}
	action def PerformRendezvousManeuvers :> Operation {
		doc /* A series of precise orbital maneuvers performed by the LM to match the orbit of and approach the CSM. */
	}
	action def ConductLMCSMDocking :> Operation {
		doc /* The physical connection of the LM Ascent Stage with the orbiting CSM. */
	}
	action def TransferCrewAndSamples :> Operation {
		doc /* The movement of the crew and collected lunar samples from the LM back into the Command Module. */
	}
	action def JettisonLM :> Operation {
		doc /* The final separation from the LM Ascent Stage, leaving it in lunar orbit. */
	}

	action def ExecuteTEIBurn :> Operation {
		doc /* The engine burn of the Service Module to propel the CSM out of lunar orbit and onto a trajectory back to Earth. */
	}
	action def PrepareCMforReentry :> Operation {
		doc /* Final checks and configurations of the Command Module in preparation for atmospheric entry. */
	}

	action def SeparateModules :> Operation {
		doc /* The pyrotechnic separation of the Command Module from the Service Module just before reentry. */
	}
	action def GuideReentryTrajectory :> Operation {
		doc /* The controlled, lifting flight of the Command Module through the atmosphere to manage heating and target the landing zone. */
	}
	action def DeployParachutes :> Operation {
		doc /* The sequential deployment of drogue and main parachutes to slow the Command Module for a safe splashdown. */
	}
	action def ConductSplashdownOperations :> Operation {
		doc /* The final water landing of the Command Module and the activation of its recovery systems. */
	}

	action def RetrieveCrewAndCM :> Operation {
		doc /* The location and recovery of the crew and capsule from the ocean by naval forces. */
	}
	action def InitiateQuarantineProcedures :> Operation {
		doc /* The implementation of biological isolation protocols for the crew, capsule, and samples upon their return. */
	}
	action def SecureLunarSamples :> Operation {
		doc /* The process of packaging and transporting the returned lunar samples to the Lunar Receiving Laboratory. */
	}
}