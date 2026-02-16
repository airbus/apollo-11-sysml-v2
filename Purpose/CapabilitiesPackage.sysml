//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package CapabilitiesPackage {
	
	private import CoSMAPackage::*;
	private import StakeholderNeedsPackage::*;
	private import ModelingMetadata::*;
	
	part def ProgrammaticAndPublicAffairsManagement :> Capability {
		doc /* The ability to manage budgets, schedules, stakeholder communications, and public relations to maintain political and public support for a large-scale, high-cost program. */
		#refinement dependency ProgrammaticAndPublicAffairsManagement to StakeholderNeedsPackage::'SHN-N003';
		#refinement dependency ProgrammaticAndPublicAffairsManagement to StakeholderNeedsPackage::'SHN-N017';
		#refinement dependency ProgrammaticAndPublicAffairsManagement to StakeholderNeedsPackage::'SHN-N018';
		#refinement dependency ProgrammaticAndPublicAffairsManagement to StakeholderNeedsPackage::'SHN-N020';	
	}
	
	part def HeavyLiftLaunch :> Capability {
		doc /* The capability to propel extremely heavy payloads from Earth's surface into various orbital and interplanetary trajectories. */
		#refinement dependency HeavyLiftLaunch to StakeholderNeedsPackage::'SHN-N001';
		#refinement dependency HeavyLiftLaunch to StakeholderNeedsPackage::'SHN-N019';
		#refinement dependency HeavyLiftLaunch to StakeholderNeedsPackage::'SHN-N022';
	} 

	part def MultiStagePropulsion :> Capability {
		doc /* The ability to efficiently shed mass during ascent through the sequential operation of multiple rocket stages, optimizing for different phases of flight. */
		#refinement dependency MultiStagePropulsion to StakeholderNeedsPackage::'SHN-N001';
	}
	
	part def PrecisionOrbitalMechanics :> Capability {
		doc /* The capability to accurately calculate, execute, and refine trajectories and orbital maneuvers in complex gravitational fields (Earth-Moon system). This includes achieving and maintaining stable orbits, as well as performing precise rendezvous and docking operations in space. */
		#refinement dependency PrecisionOrbitalMechanics to StakeholderNeedsPackage::'SHN-N001';
		#refinement dependency PrecisionOrbitalMechanics to StakeholderNeedsPackage::'SHN-N022';		
	}
	
	part def AtmosphericReentryAndLanding :> Capability {
		doc /* The ability to guide a spacecraft safely through Earth's atmosphere, dissipate extreme heat, control descent, and achieve a soft water landing. */
		#refinement dependency AtmosphericReentryAndLanding to StakeholderNeedsPackage::'SHN-N002';
		#refinement dependency AtmosphericReentryAndLanding to StakeholderNeedsPackage::'SHN-N007';		
	}
	
	part def DeepSpaceHabitationAndLifeSupport :> Capability {
		doc /* Providing sustained environments for humans in the vacuum of space, managing air quality, temperature, humidity, water, and waste for extended durations. */
		#refinement dependency DeepSpaceHabitationAndLifeSupport to StakeholderNeedsPackage::'SHN-N002';
		#refinement dependency DeepSpaceHabitationAndLifeSupport to StakeholderNeedsPackage::'SHN-N007';
		#refinement dependency DeepSpaceHabitationAndLifeSupport to StakeholderNeedsPackage::'SHN-N011';	
	}
	
	part def AutonomousAndAssistedNavigationGuidanceAndControl :> Capability {
		doc /* Systems capable of determining position and velocity, calculating optimal paths, and executing maneuvers, both independently and with ground assistance. */
		#refinement dependency AutonomousAndAssistedNavigationGuidanceAndControl to StakeholderNeedsPackage::'SHN-N022';
	}
	
	part def InSpacePropulsion :> Capability {
		doc /* The ability to provide thrust for major orbital changes and trans-planetary injections using highly reliable and powerful engines. */
		#refinement dependency InSpacePropulsion to StakeholderNeedsPackage::'SHN-N001';
	}
	
	part def PowerGenerationAndDistribution :> Capability {
		doc /* Reliable systems to generate and distribute electrical power to all spacecraft systems throughout the mission. */
		#refinement dependency PowerGenerationAndDistribution to StakeholderNeedsPackage::'SHN-N001';
	}
	
	part def LunarSurfaceLandingAndAscent :> Capability {
		doc /* The specialized capability to de-orbit, perform a powered descent to a planetary surface, and then launch from that surface back into orbit. */
		#refinement dependency LunarSurfaceLandingAndAscent to StakeholderNeedsPackage::'SHN-N004';
		#refinement dependency LunarSurfaceLandingAndAscent to StakeholderNeedsPackage::'SHN-N016';
		#refinement dependency LunarSurfaceLandingAndAscent to StakeholderNeedsPackage::'SHN-N019';
	}
	
	part def GlobalTrackingAndCommunication :> Capability {
		doc /* Maintaining continuous contact and data exchange with spacecraft across vast distances using a worldwide network of ground stations. */
		#refinement dependency GlobalTrackingAndCommunication to StakeholderNeedsPackage::'SHN-N014';
	}
	
	part def RealtimeMissionControl :> Capability {
		doc /* The ability to monitor thousands of operational parameters, analyze data, and make critical, time-sensitive decisions to guide and support the mission. */
		#refinement dependency RealtimeMissionControl to StakeholderNeedsPackage::'SHN-N012';
		#refinement dependency RealtimeMissionControl to StakeholderNeedsPackage::'SHN-N014';
		#refinement dependency RealtimeMissionControl to StakeholderNeedsPackage::'SHN-N015';	
	}
	
	part def ContingencyPlanningAndRapidResponse :> Capability {
		doc /* Developing and implementing procedures to address unforeseen anomalies or failures swiftly and effectively. */
		#refinement dependency ContingencyPlanningAndRapidResponse to StakeholderNeedsPackage::'SHN-N002';
		#refinement dependency ContingencyPlanningAndRapidResponse to StakeholderNeedsPackage::'SHN-N007';	
	}
	
	part def CrewTrainingAndSimulation :> Capability {
		doc /* Rigorous programs to prepare astronauts for all mission aspects, including emergency procedures, through realistic simulations and drills. */
		#refinement dependency CrewTrainingAndSimulation to StakeholderNeedsPackage::'SHN-N008';
		#refinement dependency CrewTrainingAndSimulation to StakeholderNeedsPackage::'SHN-N010';
		#refinement dependency CrewTrainingAndSimulation to StakeholderNeedsPackage::'SHN-N015';	
	}
	
	part def HumanPerformanceUnderExtremeStress :> Capability {
		doc /* The ability of individuals and teams to maintain focus, make sound judgments, and execute complex tasks during high-stakes situations with immense pressure. */
		#refinement dependency HumanPerformanceUnderExtremeStress to StakeholderNeedsPackage::'SHN-N009';
	}

	part def ComplexSoftwareDevelopment :> Capability { 
		doc /* Creating and verifying intricate software for real-time control, navigation, and system management in highly constrained environments. */
		#refinement dependency ComplexSoftwareDevelopment to StakeholderNeedsPackage::'SHN-N001';
	}

	part def ComplexLogisticsAndIntegration :> Capability {
		doc /* The capacity to manage the design, manufacturing, assembly, and testing of highly complex, interdependent systems on an unprecedented scale. */
		#refinement dependency ComplexLogisticsAndIntegration to StakeholderNeedsPackage::'SHN-N001';
	}
	
	part def LaunchOperationsManagement :> Capability {
		doc /* The specialized ability to meticulously prepare, fuel, and execute the launch of large-scale rockets with precision and safety. */
		#refinement dependency LaunchOperationsManagement to StakeholderNeedsPackage::'SHN-N001';
	}
	
	part def AdaptabilityAndProblemSolving :> Capability {
		doc /* The inherent human capacity to adjust to unexpected challenges and devise creative solutions in real-time. */
		#refinement dependency AdaptabilityAndProblemSolving to StakeholderNeedsPackage::'SHN-N012';
	}

	part def ExtravehicularActivitySupport :> Capability {
		doc /* Providing specialized protective suits and equipment that allow humans to operate and perform tasks safely and effectively in the vacuum and harsh environments of space and planetary surfaces. */
		#refinement dependency ExtravehicularActivitySupport to StakeholderNeedsPackage::'SHN-N011';
	}

	part def LunarMobility :> Capability {
		doc /* The ability for astronauts to move and work efficiently in lunar gravity. */
		#refinement dependency LunarMobility to StakeholderNeedsPackage::'SHN-N004';
	}

	part def ScientificDataAcquisitionAndSampleReturn :> Capability {
		doc /* The capability to deploy scientific instruments, collect geological samples from an extraterrestrial body, and return them safely for Earth-based analysis. */
		#refinement dependency ScientificDataAcquisitionAndSampleReturn to StakeholderNeedsPackage::'SHN-N005';
		#refinement dependency ScientificDataAcquisitionAndSampleReturn to StakeholderNeedsPackage::'SHN-N021';
	}

	part def PlanetaryProtection :> Capability {
		doc /* Implementing stringent protocols to prevent the biological contamination of Earth from returned extraterrestrial samples and to minimize contamination of the extraterrestrial body. */
		#refinement dependency PlanetaryProtection to StakeholderNeedsPackage::'SHN-N006';
	}

	part def RobustCommunicationAndTelemetry :> Capability {
		doc /* Establishing and maintaining reliable data and voice links over vast distances, including transmitting live video. */
		#refinement dependency RobustCommunicationAndTelemetry to StakeholderNeedsPackage::'SHN-N013';
	}
	
	part def ToolDevelopment :> Capability {
		doc /* Creating specialized tools for lunar surface tasks (e.g., sample collection, instrument deployment). */
		#refinement dependency ToolDevelopment to StakeholderNeedsPackage::'SHN-N008';
	}

}