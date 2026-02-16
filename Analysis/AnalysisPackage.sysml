//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package AnalysisPackage {
	
	private import MissionPackage::*;
	private import CoSMAPackage::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import CoSMAPackage::*;
	private import CalculationsPackage::*;
	private import ISQ::*;
	private import SI::*;
	private import TechnicalComponentsPackage::*;
	private import Apollo11MissionExecutionPackage::*;
	
	analysis def SystemPowerAnalysis {
		doc /* Analysis to calculate the total power generation, load, and margin for a composite system by iterating over its parts. */
		subject systemToAnalyze : System; 

		out totalPowerGenerated :> ISQ::power = rollupPowerGeneration(systemToAnalyze);
		out totalPowerLoad :> ISQ::power = rollupPowerConsumption(systemToAnalyze);
		out powerMargin :> ISQ::power = calculatePowerMargin(totalPowerGenerated, totalPowerLoad);

		assert constraint {
			powerMargin > 0[W]
		}
	}

	analysis Apollo11MissionSystemPowerAnalysis : SystemPowerAnalysis {
		doc /* Runs the iterative power analysis on the entire Apollo 11 Mission System. */

		subject apollo11MissionSystem : System;
	}
	
	analysis def SystemMassAnalysis {
		doc /* An analysis to track the total mass of the spacecraft throughout the mission (mass budget). */
		subject apollo11Mission : Apollo11Mission;

		in initialLaunchMass :> ISQ::mass;
		in propellantMassPerStage :> ISQ::mass[*];
		in jettisonedComponentMass :> ISQ::mass[*];
		out massAfterBurn :> ISQ::mass = calculateMassBudgetStep(initialLaunchMass, propellantMassPerStage, jettisonedComponentMass);
	}
	
	analysis Apollo11MissionSuccessAnalysis {
		doc /* A top-level analysis to evaluate whether the primary mission objectives were met. */
		subject apollo11Mission : Apollo11MissionIndividual;

		out overallMissionSuccess : ScalarValues::Boolean = evaluateMissionSuccess(apollo11Mission.crewReturnedSafely, apollo11Mission.softLandingAchieved, apollo11Mission.requiredSamplesReturned, apollo11Mission.instrumentsDeployed);
		
		assert constraint {
			overallMissionSuccess = true;
		}		
	}	
	
	analysis Apollo11LifecycleReliabilityAnalysis {
		doc /* An analysis to predict the probability of mission success based on the reliability of critical components over time. */
		subject apollo11Mission : Apollo11Mission;

		out cmReliability : RatioValue = calculateReliability(
			apollo11Mission.apollo11MissionSystem.spacecraft.csm.commandModule.failureRate,
			apollo11Mission.plannedDuration
		);
		out smReliability : RatioValue = calculateReliability(
			apollo11Mission.apollo11MissionSystem.spacecraft.csm.serviceModule.failureRate,
			apollo11Mission.plannedDuration
		);
		out lmReliability : RatioValue = calculateReliability(
			apollo11Mission.apollo11MissionSystem.spacecraft.lm.failureRate,
			apollo11Mission.plannedDuration / 2 // LM is only used for half the mission
		);
	}	
	
	analysis def MissionCostAnalysis {
		doc /* A budgetary analysis to determine the total financial cost of a mission. */
		subject mission : Mission;

		out totalMissionCost :> currency = sumCosts(mission.researchAndDevelopmentCost, mission.manufacturingCost, mission.operationsCost, mission.personnelCost);

	}
	
	analysis Apollo11MissionCostAnalysis : MissionCostAnalysis {
		subject apollo11Mission : Apollo11Mission;
	} 
	
	analysis Apollo11MissionDeltaVBudgetAnalysis {
		doc /* Performs a full delta-v budget analysis for the Apollo 11 mission to verify that the propulsive capabilities of the hardware can meet the demands of the mission trajectory. */
		
		subject apollo11Mission : Apollo11Mission;
		
		launchVehicle : SaturnV = apollo11Mission.apollo11MissionSystem.launchVehicle;
		spacecraft : ApolloSpacecraft = apollo11Mission.apollo11MissionSystem.spacecraft;
		
		sic = launchVehicle.stage1;
		sii = launchVehicle.stage2;
		sivb = launchVehicle.stage3;
		iu = launchVehicle.instrumentUnit;
		les = spacecraft.launchEscapeSystem;
		sla = spacecraft.spacecraftLMAdapter;
		cm = spacecraft.commandServiceModule.commandModule;
		sm = spacecraft.commandServiceModule.serviceModule;
		lmds = spacecraft.lunarModule.lunarModuleDescentStage;
		lmas = spacecraft.lunarModule.lunarModuleAscentStage;

		// Define mass stacks for each phase
		fullStack = (sii, sivb, iu, sla, sm, cm, lm);
		secondStageStack = (sivb, iu, sla, sm, cm, lm);
		tliStack = (sla, sm, cm, lm);
		spacecraftStack = (sm, cm, lm);
		
		// Calculate delta-v capability for each stage
		dv_stage1 = calculateLaunchStageDeltaV(sic, fullStack);
		dv_stage2 = calculateLaunchStageDeltaV(sii, secondStageStack);
		dv_stage3_tli = calculateLaunchStageDeltaV(sivb, spacecraftStack);
		
		dv_csm = calculateSpacecraftBurnDeltaV(sm);
		dv_lm_descent = calculateSpacecraftBurnDeltaV(lmds);
		dv_lm_ascent = calculateSpacecraftBurnDeltaV(lmas);
		
		// Required delta-v for phases
		dv_required_tli = calculateTliDeltaV(3.986E14 ['m³⋅s⁻²'], 6563 ['km'], 384400 ['km']);
		dv_required_loi = calculateLoiDeltaV(1000 ['m⋅s⁻¹'], 4.9E12 ['m³⋅s⁻²'], 1839 ['km']);
		dv_required_leo = 9400 ['m⋅s⁻¹'];
		dv_required_landing = 2100 ['m⋅s⁻¹'];
		dv_required_ascent = 1870 ['m⋅s⁻¹'];
		dv_required_tei = 1000 ['m⋅s⁻¹'];

		// S-IC and S-II combine to provide most of the velocity to orbit.
		ascentCapability = dv_stage1 + dv_stage2;
		ascentMargin = ascentCapability - dv_required_leo;
			
		// S-IVB performs the final orbit insertion and the TLI burn.
		tliMargin = dv_stage3_tli - dv_required_tli;
			
		// Service module performs LOI and TEI
		loiMargin = dv_csm - (dv_required_loi + dv_required_tei);
			
		// LM Descent Stage must have enough delta-v to land
		landingMargin = dv_lm_descent - dv_required_landing;
			
		// LM Ascent Stage must have enough delta-v to reach orbit
		ascentMargin_lunar = dv_lm_ascent - dv_required_ascent;

		// The mission is feasible if all margins are positive.
		assert constraint { 
			ascentMargin > 0 ['m⋅s⁻¹'] and
			tliMargin > 0 ['m⋅s⁻¹'] and
			loiMargin > 0 ['m⋅s⁻¹'] and
			landingMargin > 0 ['m⋅s⁻¹'] and
			ascentMargin_lunar > 0 ['m⋅s⁻¹']
		}
	}
}