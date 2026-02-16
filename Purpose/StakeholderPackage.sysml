//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package StakeholderPackage {

	private import CoSMAPackage::*;
	private import AstronautsPackage::*;
	private import StakeholderNeedsPackage::*;

	part def GovernmentAgency :> Stakeholder;
	part def AerospaceCompany :> Stakeholder;
	part def MissionControlPersonnel :> Stakeholder;
	part def ScientificCommunity :> Stakeholder;
	part def Public :> Stakeholder;
	part def Media :> Stakeholder;
	part def ForeignNation :> Stakeholder;

	part NASA : GovernmentAgency {
		:> influenceLevel = StakeholderInfluenceLevel::high;
		:> influenceKind = StakeholderInfluenceKind::direct;
		item concern1 : Concern {
			doc /* Mission Success (technical & operational) */
		} :> concerns;
		item concern2 : Concern {
			doc /* Astronaut Safety */
		} :> concerns;
		item concern3 : Concern {
			doc /* Maintaining Public & Political Funding */
		} :> concerns;
		item concern4 : Concern {
			doc /* International Prestige (Cold War superiority) */
		} :> concerns;
		item concern5 : Concern {
			doc /* Scientific Return from Lunar Samples */
		} :> concerns;
		item concern6 : Concern {
			doc /* Preventing Back Contamination (Quarantine) */
		} :> concerns;
		requirement missionSuccess:MissionSuccess :> needs;
		requirement astronautSafety:AstronautSafety :> needs;
		requirement programmaticFunding:ProgrammaticFunding :> needs;
		requirement internationalPrestige:InternationalPrestige :> needs;
		requirement scientificReturn:ScientificReturn :> needs;
		requirement planetaryProtection:PlanetaryProtection :> needs;
	}

	part Apollo11Crew : Stakeholder {
		:> influenceLevel = StakeholderInfluenceLevel::high;
		:> influenceKind = StakeholderInfluenceKind::direct;
		item concern1 : Concern {
			doc /* Personal Survival */
		} :> concerns;
		item concern2 : Concern {
			doc /* Successful Execution of Mission Procedures */
		} :> concerns;
		item concern3 : Concern {
			doc /* Managing Stress & Performance Pressure */
		} :> concerns;
		item concern4 : Concern {
			doc /* Adeq :> concerns;uate Training & Preparation */
		} :> concerns;
		item concern5 : Concern {
			doc /* Unknowns of Lunar Environment (e.g., dust, regolith stability) */
		} :> concerns;
		requirement crewSurvival:CrewSurvival :> needs;
		requirement proceduralSuccess:ProceduralSuccess :> needs;
		requirement performanceUnderPressure:PerformanceUnderPressure :> needs;
		requirement trainingFidelity:TrainingFidelity :> needs;
		requirement environmentalHazardProtection:EnvironmentalHazardProtection :> needs;
	}

	part MissionControl : MissionControlPersonnel {
		:> influenceLevel = StakeholderInfluenceLevel::high;
		:> influenceKind = StakeholderInfluenceKind::direct;
		item concern1 : Concern {
			doc /* Real-time Problem Solving (e.g., 1202/1201 alarms) */
		} :> concerns;
		item concern2 : Concern {
			doc /* Accurate Data Analysis & Decision Making */
		} :> concerns;
		item concern3 : Concern {
			doc /* Continuous Crew Support & Communication */
		} :> concerns;
		item concern4 : Concern {
			doc /* Operational Flawlessness & Coordination */
		} :> concerns;
		requirement realtimeProblemSolving:RealtimeProblemSolving :> needs;
		requirement dataAccuracy:DataAccuracy :> needs;
		requirement continuousSupport:ContinuousSupport :> needs;
		requirement operationalCoordination:OperationalCoordination :> needs;
	}

	part Grumman : AerospaceCompany {
		:> influenceLevel = StakeholderInfluenceLevel::medium;
		:> influenceKind = StakeholderInfluenceKind::direct;
		item concern1 : Concern {
			doc /* Successful Lunar Module Performance */
		} :> concerns;
		item concern2 : Concern {
			doc /* Meeting Schedule & Budget */
		} :> concerns;
		item concern3 : Concern {
			doc /* Company Reputation */
		} :> concerns;
		requirement lunarModulePerformance:LunarModulePerformance :> needs;
		requirement programmaticAdherence:ProgrammaticAdherence :> needs;
		requirement reputationalSuccess:ReputationalSuccess :> needs;
	}

	part USGovernment : GovernmentAgency {
		:> influenceLevel = StakeholderInfluenceLevel::high;
		:> influenceKind = StakeholderInfluenceKind::direct;
		item concern1 : Concern {
			doc /* National Prestige (Space Race victory) */
		} :> concerns;
		item concern2 : Concern {
			doc /* Public Confidence & Morale */
		} :> concerns;
		item concern3 : Concern {
			doc /* Justifying Financial Investment */
		} :> concerns;
		item concern4 : Concern {
			doc /* National Security */
		} :> concerns;
		requirement nationalPrestige:NationalPrestige :> needs;
		requirement publicConfidence:PublicConfidence :> needs;
		requirement investmentJustification:InvestmentJustification :> needs;
		requirement nationalSecurityDemonstration:NationalSecurityDemonstration :> needs;
	}

	part SovietUnion : ForeignNation {
		:> influenceLevel = StakeholderInfluenceLevel::low;
		:> influenceKind = StakeholderInfluenceKind::indirect;
		item concern1 : Concern {
			doc /* Loss of Prestige (being beaten to the Moon) */
		} :> concerns;
		item concern2 : Concern {
			doc /* Assessing US Technological Capabilities */
		} :> concerns;
	}

	part Geologists : ScientificCommunity {
		:> influenceLevel = StakeholderInfluenceLevel::low;
		:> influenceKind = StakeholderInfluenceKind::indirect;
		item concern1 : Concern {
			doc /* Valuable Lunar Sample Collection */
		} :> concerns;
		item concern2 : Concern {
			doc /* Deployment of Scientific Instruments (e.g., seismometer) */
		} :> concerns;
		item concern3 : Concern {
			doc /* Integrity & Non-contamination of Samples */
		} :> concerns;
		item concern4 : Concern {
			doc /* Access to Data & Samples */
		} :> concerns;
	}

	part AmericanPublic : Public {
		:> influenceLevel = StakeholderInfluenceLevel::medium;
		:> influenceKind = StakeholderInfluenceKind::indirect;
		item concern1 : Concern {
			doc /* National Pride & Inspiration */
		} :> concerns;
		item concern2 : Concern {
			doc /* Astronaut Safety */
		} :> concerns;
		item concern3 : Concern {
			doc /* Cost vs. Other Priorities (minority view) */
		} :> concerns;
	}

	part GlobalPublic : Public {
		:> influenceLevel = StakeholderInfluenceLevel::low;
		:> influenceKind = StakeholderInfluenceKind::indirect;
		item concern1 : Concern {
			doc /* Shared Human Achievement */
		} :> concerns;
		item concern2 : Concern {
			doc /* Peaceful Use of Space */
		} :> concerns;
	}

	part NewsMedia : Media {
		:> influenceLevel = StakeholderInfluenceLevel::medium;
		:> influenceKind = StakeholderInfluenceKind::indirect;
		item concern1 : Concern {
			doc /* Accurate & Timely Reporting */
		} :> concerns;
		item concern2 : Concern {
			doc /* Access to Information & Officials */
		} :> concerns;
		item concern3 : Concern {
			doc /* Compelling Narrative */
		} :> concerns;
	}

	part AstronautFamilies : Stakeholder {
		:> influenceLevel = StakeholderInfluenceLevel::low;
		:> influenceKind = StakeholderInfluenceKind::indirect;
		item concern1 : Concern {
			doc /* Safety of Loved Ones */
		} :> concerns;
		item concern2 : Concern {
			doc /* Privacy from Public Scrutiny */
		} :> concerns;
	}

	part FutureGenerations : Stakeholder {
		:> influenceLevel = StakeholderInfluenceLevel::low;
		:> influenceKind = StakeholderInfluenceKind::indirect;
		item concern1 : Concern {
			doc /* Legacy of Exploration) */
		} :> concerns;
		item concern2 : Concern {
			doc /* Preservation of Knowledge */
		} :> concerns;
	}


}