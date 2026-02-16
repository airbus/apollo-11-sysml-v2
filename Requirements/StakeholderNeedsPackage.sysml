//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package StakeholderNeedsPackage {

	private import ModelingMetadata::*;
    private import CoSMAPackage::*;

	requirement def <'SHN-N001'> MissionSuccess :> StakeholderNeed {
		doc /* The mission shall succeed in all its technical and operational objectives. */
		@Rationale {
			text = "The primary responsibility of the agency is to successfully execute the missions it is tasked with, thereby fulfilling its national mandate.";
		}
	}

	requirement def <'SHN-N002'> AstronautSafety :> StakeholderNeed {
		doc /* The mission shall ensure the safety and survival of the astronauts throughout all phases. */
		@Rationale {
			text = "The agency has a fundamental duty of care for its personnel, and the success of the human spaceflight program depends on ensuring crew safety.";
		}
	}

	requirement def <'SHN-N003'> ProgrammaticFunding :> StakeholderNeed {
		doc /* The mission's execution and public profile shall be managed to maintain continued public and political support and funding. */
		@Rationale {
			text = "The Apollo program's existence is contingent on a massive financial commitment, which requires sustained political and public approval.";
		}
	}

	requirement def <'SHN-N004'> InternationalPrestige :> StakeholderNeed {
		doc /* The mission shall demonstrate technological superiority and achieve its primary objectives before any competing nation. */
		@Rationale {
			text = "A core driver of the Apollo program was to win the Space Race, a key element of the Cold War geopolitical landscape.";
		}
	}

	requirement def <'SHN-N005'> ScientificReturn :> StakeholderNeed {
		doc /* The mission shall yield significant scientific data, primarily through the return of lunar samples. */
		@Rationale {
			text = "Beyond the political goals, a key justification for the mission is the unique opportunity for scientific discovery.";
		}
	}

	requirement def <'SHN-N006'> PlanetaryProtection :> StakeholderNeed {
		doc /* The mission shall prevent the contamination of Earth's biosphere by potential extraterrestrial life forms. */
		@Rationale {
			text = "As a matter of public safety and scientific integrity, the agency must ensure that no harm comes from introducing unsterilized materials to Earth.";
		}
	}

	requirement def <'SHN-N007'> CrewSurvival :> StakeholderNeed {
		doc /* The mission systems and procedures shall ensure the crew can survive all mission phases. */
		@Rationale {
			text = "The most fundamental need of any human participant in a high-risk endeavor is to survive the experience.";
		}
	}

	requirement def <'SHN-N008'> ProceduralSuccess :> StakeholderNeed {
		doc /* The mission shall provide the tools, training, and systems necessary for the successful execution of all assigned procedures. */
		@Rationale {
			text = "The crew's professional responsibility and the mission's success depend on their ability to perform their tasks correctly.";
		}
	}

	requirement def <'SHN-N009'> PerformanceUnderPressure :> StakeholderNeed {
		doc /* The mission environment and crew selection shall enable the management of extreme stress and pressure to ensure peak performance. */
		@Rationale {
			text = "The psychological demands of a lunar mission are extreme; the crew's ability to cope is critical to success and safety.";
		}
	}

	requirement def <'SHN-N010'> TrainingFidelity :> StakeholderNeed {
		doc /* The mission training program shall adequately prepare the crew for all nominal and contingency scenarios. */
		@Rationale {
			text = "High-fidelity training is the primary tool for mitigating risks and ensuring the crew can respond correctly to any situation.";
		}
	}

	requirement def <'SHN-N011'> EnvironmentalHazardProtection :> StakeholderNeed {
		doc /* The mission systems shall protect the crew from the known and unknown hazards of the lunar environment. */
		@Rationale {
			text = "Hazards such as abrasive dust and unstable ground pose a direct threat to the crew and equipment on the lunar surface.";
		}
	}

	requirement def <'SHN-N012'> RealtimeProblemSolving :> StakeholderNeed {
		doc /* The mission systems shall provide the necessary data and communication links to enable real-time problem solving from the ground. */
		@Rationale {
			text = "Unforeseen anomalies are expected, and Mission Control's ability to analyze and solve them in real-time is a critical safety function.";
		}
	}

	requirement def <'SHN-N013'> DataAccuracy :> StakeholderNeed {
		doc /* The mission shall provide accurate and reliable telemetry to support critical ground-based decision making. */
		@Rationale {
			text = "The safety of the crew and success of the mission depend on ground controllers making decisions based on correct data.";
		}
	}

	requirement def <'SHN-N014'> ContinuousSupport :> StakeholderNeed {
		doc /* The mission shall enable continuous communication to provide uninterrupted support to the flight crew. */
		@Rationale {
			text = "The crew in space relies on the ground team for information, calculations, and support that they cannot manage alone.";
		}
	}

	requirement def <'SHN-N015'> OperationalCoordination :> StakeholderNeed {
		doc /* The mission shall be executed with a high degree of coordination between all flight and ground control teams. */
		@Rationale {
			text = "A complex mission requires flawless teamwork and communication across multiple specialized teams to function correctly.";
		}
	}
	
	requirement def <'SHN-N016'> LunarModulePerformance :> StakeholderNeed {
		doc /* The Lunar Module vehicle shall perform all its functions successfully, including landing, life support, and ascent. */
		@Rationale {
			text = "As the manufacturer, the company's primary interest is the successful and reliable performance of its product.";
		}
	}

	requirement def <'SHN-N017'> ProgrammaticAdherence :> StakeholderNeed {
		doc /* The development and delivery of the Lunar Module shall adhere to the programmatic schedule and budget. */
		@Rationale {
			text = "Meeting contractual obligations regarding schedule and budget is a primary business need for any contractor.";
		}
	}

	requirement def <'SHN-N018'> ReputationalSuccess :> StakeholderNeed {
		doc /* The success of the Lunar Module shall enhance the company's reputation as a leading aerospace contractor. */
		@Rationale {
			text = "A successful high-profile mission provides immense reputational value and secures opportunities for future contracts.";
		}
	}

	requirement def <'SHN-N019'> NationalPrestige :> StakeholderNeed {
		doc /* The mission shall achieve its goal of a crewed lunar landing to demonstrate national technological supremacy. */
		@Rationale {
			text = "The mission was a central element of the Cold War Space Race, and achieving the landing was a primary geopolitical objective.";
		}
	}

	requirement def <'SHN-N020'> PublicConfidence :> StakeholderNeed {
		doc /* The mission shall be conducted successfully and safely to bolster public confidence and morale. */
		@Rationale {
			text = "A successful mission serves as a unifying national event and a demonstration of the government's capabilities.";
		}
	}

	requirement def <'SHN-N021'> InvestmentJustification :> StakeholderNeed {
		doc /* The mission shall produce sufficient scientific and symbolic returns to justify the significant national financial investment. */
		@Rationale {
			text = "The high cost of the program necessitates tangible results, such as scientific knowledge and national prestige, to be considered a worthwhile expenditure.";
		}
	}

	requirement def <'SHN-N022'> NationalSecurityDemonstration :> StakeholderNeed {
		doc /* The mission shall demonstrate advanced technological capabilities relevant to national security. */
		@Rationale {
			text = "The capabilities required for a lunar mission (e.g., large rockets, global tracking, precision guidance) are inherently linked to national security interests.";
		}
	}
}