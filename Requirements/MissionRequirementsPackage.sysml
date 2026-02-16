//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package MissionRequirementsPackage {

	private import SI::*;
	private import ISQ::*;
	private import ScalarValues::*;
	private import CoSMAPackage::*;
	private import CoSMAQuantitiesAndUnitsPackage::*;
	private import USCustomaryUnits::*;
	private import ModelingMetadata::*;


	requirement def <'HLR-R001'> CrewReturnSafetyRequirement {
		doc /* The Apollo 11 Mission shall safely return all three crew members to Earth,
			with no life-threatening injuries or long-term health impacts, by July 24, 1969. */
		@Rationale {
			text = "This requirement is paramount for fulfilling the core mission objective (Go to Moon) and directly addresses the primary concern of all stakeholders (NASA, Astronauts, Families, Public, U.S. Government) regarding human life safety.";
		}
		attribute crewInjuryCount: Integer;
		attribute maxAcceptableInjuries: Integer = 0;

		require constraint { crewInjuryCount <= maxAcceptableInjuries }
		#refinement dependency 'HLR-R001' to CapabilitiesPackage::DeepSpaceHabitationAndLifeSupport;
		#refinement dependency 'HLR-R001' to CapabilitiesPackage::AtmosphericReentryAndLanding;
		#refinement dependency 'HLR-R001' to CapabilitiesPackage::ContingencyPlanningAndRapidResponse;
	}

	requirement def <'HLR-R002'> LunarLanderSoftLandingRequirement {
		doc /* The Apollo 11 Mission shall achieve a soft landing of the crewed lunar lander on the lunar surface
			within the designated landing zone (Tranquility Base), by July 20, 1969. */
		@Rationale {
			text = "A soft and precise lunar landing is fundamental to the 'Go to Moon' goal and ensures the integrity of the lander and safety of the crew for surface operations and subsequent ascent.";
		}

		attribute actualVerticalVelocity :> ISQ::speed;
		attribute maxVerticalVelocity :> ISQ::speed = 2 [m/s];

		attribute actualHorizontalVelocity :> ISQ::speed;
		attribute maxHorizontalVelocity :> ISQ::speed = 0.5 [m/s];

		attribute actualLandingZoneDeviation :> ISQ::length;
		attribute maxLandingZoneDeviation :> ISQ::length = 1000 [m];

		require constraint {
			(actualVerticalVelocity <= maxVerticalVelocity) and
			(actualHorizontalVelocity <= maxHorizontalVelocity) and
			(actualLandingZoneDeviation <= maxLandingZoneDeviation)
		}
		#refinement dependency 'HLR-R002' to CapabilitiesPackage::LunarSurfaceLandingAndAscent;
		#refinement dependency 'HLR-R002' to CapabilitiesPackage::PrecisionOrbitalMechanics;
		#refinement dependency 'HLR-R002' to CapabilitiesPackage::AutonomousAndAssistedNavigationGuidanceAndControl;		
	}

	requirement def <'HLR-R003'> TransLunarInjectionAccuracyRequirement {
		doc /* The Apollo 11 Mission launch system shall successfully place the spacecraft into a Trans-Lunar Injection (TLI) trajectory
			with a delta-V accuracy of +/- 0.5 meters per second and a path leading to lunar orbit insertion within 75 hours from launch,
			on July 16, 1969. */
		@Rationale {
			text = "Accurate Trans-Lunar Injection is essential for reaching the Moon efficiently and correctly, directly supporting the 'Go to Moon' goal and minimizing the need for costly and time-consuming mid-course corrections.";
		}

		attribute actualDeltaVAccuracy :> ISQ::speed;
		attribute maxDeltaVAccuracy :> ISQ::speed = 0.5 [m/s];

		attribute actualTimeToLunarOrbitInsertion :> ISQ::time;
		attribute maxTimeToLunarOrbitInsertion :> ISQ::time = 75 [h];

		require constraint {
			(actualDeltaVAccuracy <= maxDeltaVAccuracy) and
			(actualTimeToLunarOrbitInsertion <= maxTimeToLunarOrbitInsertion)
		}
		#refinement dependency 'HLR-R003' to CapabilitiesPackage::HeavyLiftLaunch;
		#refinement dependency 'HLR-R003' to CapabilitiesPackage::MultiStagePropulsion;
		#refinement dependency 'HLR-R003' to CapabilitiesPackage::PrecisionOrbitalMechanics;		
	}

	requirement def <'HLR-R004'> CommunicationUptimeRequirement {
		doc /* The Apollo 11 Mission's communication system shall maintain continuous voice and telemetry contact with ground control
			for >= 95% of the mission duration, with no single blackout exceeding 10 minutes during lunar farside passes,
			throughout the 8-day mission. */
		@Rationale {
			text = "Reliable communication is vital for real-time mission control, astronaut safety, and public engagement, addressing concerns of Mission Control, NASA, and the public.";
		}

		attribute actualCommunicationUptimePercentage: RatioValue; // Represents a percentage (0-100)
		attribute minCommunicationUptimePercentage: RatioValue = 95['%'];

		attribute maxSingleBlackoutDuration :> ISQ::time;
		attribute allowedSingleBlackoutDuration :> ISQ::time = 10 [min];

		require constraint {
			(actualCommunicationUptimePercentage >= minCommunicationUptimePercentage) and
			(maxSingleBlackoutDuration <= allowedSingleBlackoutDuration)
		}
		#refinement dependency 'HLR-R004' to CapabilitiesPackage::GlobalTrackingAndCommunication;
		#refinement dependency 'HLR-R004' to CapabilitiesPackage::RobustCommunicationAndTelemetry;		
	}

	requirement def <'HLR-R005'> SustainedCabinHabitability {
		doc /* The spacecraft system shall maintain an internal environment that supports crew health and cognitive performance for the mission duration. */
		@Rationale {
			text = "Human life cannot be sustained in the vacuum of space without an artificial environment. Proper habitability is critical for the crew to perform complex tasks.";
		}	
		#refinement dependency SustainedCabinHabitability to CapabilitiesPackage::DeepSpaceHabitationAndLifeSupport;
	}

	requirement def <'HLR-R006'> LunarSampleCollectionQuantityRequirement {
		doc /* The Apollo 11 Mission shall collect a minimum of 20 kilograms of documented lunar surface material,
			including contingency and bulk samples, and return them to Earth within the Mobile Quarantine Facility,
			by July 24, 1969. */
		@Rationale {
			text = "This requirement directly fulfills the 'samples' goal, providing crucial scientific data for understanding the Moon's origin and geology, and supports the scientific community's objectives.";
		}

		attribute actualSampleMass :> ISQ::mass;
		attribute minRequiredSampleMass :> ISQ::mass = 20 [kg];
		attribute contaminationPercentage: RatioValue;
		attribute maxContaminationPercentage: RatioValue = 0.1['%'];

		require constraint {
			(actualSampleMass >= minRequiredSampleMass) and
			(contaminationPercentage <= maxContaminationPercentage)
		}
		#refinement dependency 'HLR-R006' to CapabilitiesPackage::ScientificDataAcquisitionAndSampleReturn;
		#refinement dependency 'HLR-R006' to CapabilitiesPackage::ExtravehicularActivitySupport;		
	}

	requirement def <'HLR-R007'> ScientificInstrumentDeploymentRequirement {
		doc /* The Apollo 11 Mission shall deploy a visual transmission system and at least two scientific experiment packages
			on the lunar surface, and these packages shall transmit data to Earth for a minimum of 1 month post-landing. */
		@Rationale {
			text = "This requirement is essential for achieving the 'deploy' goal, providing long-term scientific data from the lunar surface and enabling public engagement through visual broadcasts.";
		}

		attribute actualDeployedVisualSystems: Integer;
		attribute minRequiredVisualSystems: Integer = 1;

		attribute actualDeployedSciencePackages: Integer;
		attribute minRequiredSciencePackages: Integer = 2;

		attribute actualDataTransmissionDuration :> ISQ::time;
		attribute minDataTransmissionDuration :> ISQ::time = 30 [d];

		require constraint {
			(actualDeployedVisualSystems >= minRequiredVisualSystems) and
			(actualDeployedSciencePackages >= minRequiredSciencePackages) and
			(actualDataTransmissionDuration >= minDataTransmissionDuration)
		}
		#refinement dependency 'HLR-R007' to CapabilitiesPackage::ScientificDataAcquisitionAndSampleReturn;
		#refinement dependency 'HLR-R007' to CapabilitiesPackage::ExtravehicularActivitySupport;		
	}

	requirement def <'HLR-R008'> LunarVisualDocumentationRequirement {
		doc /* The Apollo 11 Mission shall capture and return to Earth at least 1,000 high-resolution still photographs
			and at least 30 minutes of motion picture footage documenting the lunar terrain, deployed equipment,
			and crew activities, by July 24, 1969. */
		@Rationale {
			text = "This requirement directly supports the 'pictures' goal, providing vital visual data for scientific analysis, historical record, and public inspiration and engagement.";
		}

		attribute actualStillPhotosCount: Integer;
		attribute minStillPhotosCount: Integer = 1000;

		attribute actualMotionPictureDuration :> ISQ::time;
		attribute minMotionPictureDuration :> ISQ::time = 30 [min];

		require constraint {
			(actualStillPhotosCount >= minStillPhotosCount) and
			(actualMotionPictureDuration >= minMotionPictureDuration)
		}
		#refinement dependency 'HLR-R008' to CapabilitiesPackage::ScientificDataAcquisitionAndSampleReturn;
	}

	requirement def <'HLR-R009'> NationalSymbolDeploymentRequirement {
		doc /* The Apollo 11 Mission shall successfully plant a national symbol on the lunar surface,
			ensuring it remains upright and visible for subsequent observation (if possible),
			during the initial Extravehicular Activity on July 20, 1969. */
		@Rationale {
			text = "This requirement directly fulfills the 'flag' goal, serving as a powerful symbolic demonstration of national achievement and technological prowess, addressing the U.S. Government's and American Public's interests.";
		}

		attribute symbolSuccessfullyPlanted: Boolean;
		attribute symbolRemainsUpright: Boolean;
		attribute symbolVisibility: Boolean;

		require constraint {
			symbolSuccessfullyPlanted and symbolRemainsUpright and symbolVisibility
		}
		#refinement dependency 'HLR-R009' to CapabilitiesPackage::ExtravehicularActivitySupport;
		#refinement dependency 'HLR-R009' to CapabilitiesPackage::LunarMobility;

	}

	requirement def <'HLR-R010'> PlanetaryProtectionQuarantineRequirement {
		doc /* The Apollo 11 Mission shall implement and adhere to Level V biological quarantine procedures
			for the crew and extraterrestrial samples upon return, ensuring no detectable extraterrestrial
			biological contamination is released into Earth's biosphere, throughout the 21-day quarantine period. */
		@Rationale {
			text = "This requirement is critical for protecting Earth's environment and public health from potential unknown hazards from the Moon, addressing concerns of the U.S. Government and the global public.";
		}

		attribute actualQuarantineLevel: Integer;
		attribute requiredQuarantineLevel: Integer = 5;

		attribute biologicalContaminationDetected: Boolean;
		attribute contaminationThresholdExceeded: Boolean;

		require constraint {
			(actualQuarantineLevel == requiredQuarantineLevel) and
			not biologicalContaminationDetected and
			not contaminationThresholdExceeded
		}
		#refinement dependency 'HLR-R010' to CapabilitiesPackage::PlanetaryProtection;
	}

    requirement def <'HLR-R011'> TrajectoryNavigationPrecision {
        doc /* The mission shall maintain the capability to determine spacecraft position with sufficient 
               accuracy to ensure a safe lunar arrival. */
        @Rationale {
            text = "Precise navigation is required to intercept the Moon and enter the correct lunar orbit. Errors in trajectory determination can lead to mission loss.";
        }
        #refinement dependency TrajectoryNavigationPrecision to CapabilitiesPackage::AutonomousAndAssistedNavigationGuidanceAndControl;
    }

	requirement def <'HLR-R026'> WasteManagementEffectiveness {
		doc /* The Apollo 11 Mission's waste management system shall effectively collect and store all solid and liquid waste
			for the entire mission, preventing contamination of the cabin environment. */
		@Rationale {
			text = "Effective waste management is essential for maintaining a hygienic and safe crew cabin environment, preventing health hazards and equipment contamination.";
		}

		attribute wasteContaminationDetected: Boolean;

		require constraint { not wasteContaminationDetected }
		#refinement dependency 'HLR-R026' to CapabilitiesPackage::DeepSpaceHabitationAndLifeSupport;
	}	

	requirement def <'HLR-R028'> CrewSleepEnvironmentQuality {
		doc /* The Apollo 11 Mission's crew's sleep environment shall allow for at least 6 hours of undisturbed sleep per 24-hour period,
			characterized by noise levels below 60 decibels. */
		@Rationale {
			text = "Adequate and undisturbed sleep is crucial for maintaining crew physical and mental performance, especially during high-stress and long-duration missions.";
		}

		attribute actualUndisturbedSleepDuration :> ISQ::time;
		attribute minUndisturbedSleepDuration :> ISQ::time = 6 [h];

		attribute actualNoiseLevelMax :> ISQ::soundPressureLevel;
		attribute maxNoiseLevelReqd :> ISQ::soundPressureLevel = 60 ['dB'];

		require constraint {
			(actualUndisturbedSleepDuration >= minUndisturbedSleepDuration) and
			(actualNoiseLevelMax <= maxNoiseLevelReqd)
		}
		#refinement dependency 'HLR-R028' to CapabilitiesPackage::DeepSpaceHabitationAndLifeSupport;
	}

	requirement def <'HLR-R030'> CrewAlarmResponseTime {
		doc /* The Apollo 11 Mission's crew interface system shall provide visual and auditory alarms for all critical system failures,
			with an alarm response time of <= 1 second. */
		@Rationale {
			text = "Rapid and clear alarming is essential for the crew to quickly identify and respond to critical system failures, mitigating risks and ensuring safety.";
		}

		attribute actualAlarmResponseTime :> ISQ::time;
		attribute maxAlarmResponseTime :> ISQ::time = 1 [s];

		require constraint { actualAlarmResponseTime <= maxAlarmResponseTime }
		#refinement dependency 'HLR-R030' to CapabilitiesPackage::DeepSpaceHabitationAndLifeSupport;
	}

	requirement def <'HLR-R032'> LunarLanderToOrbiterVoiceComm {
		doc /* The Apollo 11 Mission's lunar lander's communication system shall enable voice communication between the crew on the surface
			and the crew in lunar orbit, with a signal clarity of 90% (subjective scoring). */
		@Rationale {
			text = "Reliable voice communication between the lander and orbiter crews is crucial for coordinating critical operations like rendezvous and docking, ensuring safety and mission success.";
		}

		attribute actualSignalClarity: RatioValue;
		attribute minSignalClarity: RatioValue = 90['%'];

		require constraint { actualSignalClarity >= minSignalClarity }
		#refinement dependency 'HLR-R032' to CapabilitiesPackage::RobustCommunicationAndTelemetry;
	}

	requirement def <'HLR-R033'> ExtravehicularMobilityUnitLifeSupportDuration {
		doc /* The Apollo 11 Mission's Extravehicular Mobility Unit shall provide life support for a minimum of 4 hours
			of continuous Extravehicular Activity in the lunar environment. */
		@Rationale {
			text = "Sufficient life support duration for the Extravehicular Mobility Unit is necessary to enable astronauts to perform required tasks on the lunar surface, supporting scientific and symbolic goals.";
		}

		attribute actualEMULifeSupportDuration :> ISQ::time;
		attribute minEMULifeSupportDuration :> ISQ::time = 4 [h];

		require constraint { actualEMULifeSupportDuration >= minEMULifeSupportDuration }
		#refinement dependency 'HLR-R033' to CapabilitiesPackage::ExtravehicularActivitySupport;
	}

	requirement def <'HLR-R035'> ExtravehicularMobilityUnitDexterityForTasks {
		doc /* The Apollo 11 Mission's Extravehicular Mobility Unit shall allow for manual dexterity sufficient to operate small tools and manipulate samples
			with gloved hands, demonstrating a 90% success rate for task completion during Extravehicular Activity simulations. */
		@Rationale {
			text = "Adequate dexterity in the Extravehicular Mobility Unit is essential for astronauts to effectively perform scientific and operational tasks on the lunar surface, directly impacting mission success.";
		}

		attribute actualTaskCompletionSuccessRate: RatioValue;
		attribute minTaskCompletionSuccessRate: RatioValue = 90['%'];

		require constraint { actualTaskCompletionSuccessRate >= minTaskCompletionSuccessRate }
		#refinement dependency 'HLR-R035' to CapabilitiesPackage::ExtravehicularActivitySupport;
		#refinement dependency 'HLR-R035' to CapabilitiesPackage::ToolDevelopment;		
	}

	requirement def <'HLR-R036'> LunarSurfaceMobilityRange {
		doc /* The Apollo 11 Mission's lunar surface mobility system shall enable astronauts to traverse distances of up to 50 meters
			from the lander during Extravehicular Activity with less than 10% fatigue impact on subsequent tasks. */
		@Rationale {
			text = "Ensuring efficient and manageable astronaut mobility on the lunar surface is important for maximizing the scientific return and operational effectiveness of Extravehicular Activities.";
		}

		attribute actualTraverseDistanceCapability :> ISQ::length;
		attribute minTraverseDistanceCapability :> ISQ::length = 50 [m];

		attribute actualFatigueImpact: RatioValue;
		attribute maxFatigueImpact: RatioValue = 10['%'];

		require constraint {
			(actualTraverseDistanceCapability >= minTraverseDistanceCapability) and
			(actualFatigueImpact <= maxFatigueImpact)
		}
		#refinement dependency 'HLR-R036' to CapabilitiesPackage::LunarMobility;
	}

	requirement def <'HLR-R037'> ExtravehicularActivityToolSecurity {
		doc /* All Extravehicular Activity tools used in the Apollo 11 Mission shall be operable with a minimum of two points of contact (e.g., tethered or hand-held)
			to prevent loss in lunar gravity. */
		@Rationale {
			text = "Securing tools during Extravehicular Activity is vital to prevent loss in the low lunar gravity environment, ensuring tools are available for all planned tasks and do not become debris.";
		}

		attribute toolsMeetContactRequirement: Boolean;
		attribute toolsLostDuringEVA: Integer;
		attribute maxToolsLost: Integer = 0;

		require constraint {
			toolsMeetContactRequirement and
			(toolsLostDuringEVA <= maxToolsLost)
		}
		#refinement dependency 'HLR-R037' to CapabilitiesPackage::ExtravehicularActivitySupport;
	}

	requirement def <'HLR-R038'> SamplePristinePreservation {
		doc /* Apollo 11 Mission's lunar samples shall be collected and stored in a manner that preserves their pristine lunar environment
			and prevents terrestrial contamination, ensuring less than 0.1% terrestrial material contamination by mass. */
		@Rationale {
			text = "Maintaining the pristine state of lunar samples is crucial for their scientific value, as contamination would compromise the integrity of geological analysis and understanding of lunar composition.";
		}

		attribute actualTerrestrialContamination: RatioValue;
		attribute maxTerrestrialContamination: RatioValue = 0.1['%'];

		require constraint { actualTerrestrialContamination <= maxTerrestrialContamination }
		#refinement dependency 'HLR-R038' to CapabilitiesPackage::ScientificDataAcquisitionAndSampleReturn;
		#refinement dependency 'HLR-R038' to CapabilitiesPackage::PlanetaryProtection;		
	}

	requirement def <'HLR-R040'> SampleGeologicalContext {
		doc /* The Apollo 11 Mission shall obtain geological context for all collected samples through photographic documentation
			with clear scale references, ensuring >= 90% of samples are correlated with their collection location. */
		@Rationale {
			text = "Providing accurate geological context for samples is vital for interpreting their scientific significance and understanding the Moon's stratigraphy and formation.";
		}

		attribute actualSampleCorrelationPercentage: RatioValue;
		attribute minSampleCorrelationPercentage: RatioValue = 90['%'];
		attribute photosHaveScaleReferences: Boolean;

		require constraint {
			(actualSampleCorrelationPercentage >= minSampleCorrelationPercentage) and
			photosHaveScaleReferences
		}
		#refinement dependency 'HLR-R040' to CapabilitiesPackage::ScientificDataAcquisitionAndSampleReturn;
	}

	requirement def <'HLR-R045'> CriticalComponentRedundancy {
		doc /* The Apollo 11 Mission shall have redundancy (N+1 or greater) for all critical single-point-of-failure components
			in propulsion, Guidance, Navigation, and Control, and life support systems, ensuring continued operation after a single failure. */
		@Rationale {
			text = "Redundancy for single points of failure is a fundamental safety and reliability measure, allowing the mission to continue even if a critical component fails.";
		}

		attribute singleFailureCausesOperationalLoss: Boolean;

		require constraint { not singleFailureCausesOperationalLoss }
		#refinement dependency 'HLR-R045' to CapabilitiesPackage::ContingencyPlanningAndRapidResponse;
	}

	requirement def <'HLR-R046'> AbortSequenceExecutionTime {
		doc /* Apollo 11 Mission Control shall be capable of initiating and executing an abort sequence
			from any point during ascent or Trans-Lunar/Earth Coast within 5 minutes of an abort decision. */
		@Rationale {
			text = "Rapid abort capability is a critical safety net, allowing the mission to be terminated and the crew safely returned in response to unforeseen catastrophic failures.";
		}

		attribute actualAbortExecutionTime :> ISQ::time;
		attribute maxAbortExecutionTime :> ISQ::time = 5 [min];

		require constraint { actualAbortExecutionTime <= maxAbortExecutionTime }
		#refinement dependency 'HLR-R046' to CapabilitiesPackage::ContingencyPlanningAndRapidResponse;
		#refinement dependency 'HLR-R046' to CapabilitiesPackage::RealtimeMissionControl;		
	}

	requirement def <'HLR-R047'> ManualOverrideResponseTime {
		doc /* The Apollo 11 Mission's crew shall be able to manually override automated flight control systems
			for all major maneuvers (e.g., Trans-Lunar Injection, Lunar Orbit Insertion, Powered Descent Initiation) with a response time of <= 1 second. */
		@Rationale {
			text = "Manual override capability provides a crucial human element of control and contingency in case automated systems fail or encounter unexpected conditions, directly enhancing safety.";
		}

		attribute actualOverrideResponseTime :> ISQ::time;
		attribute maxOverrideResponseTime :> ISQ::time = 1 [s];

		require constraint { actualOverrideResponseTime <= maxOverrideResponseTime }
		#refinement dependency 'HLR-R047' to CapabilitiesPackage::HumanPerformanceUnderExtremeStress;
	}

	requirement def <'HLR-R048'> GroundSegmentDataUpdateFrequency {
		doc /* The Apollo 11 Mission's ground segment shall provide up-to-date trajectory and state vector information
			to the flight crew at least every 10 minutes during dynamic flight phases. */
		@Rationale {
			text = "Frequent and up-to-date information from ground control is essential for the crew's situational awareness, navigation, and ability to execute maneuvers safely and accurately.";
		}

		attribute actualUpdateInterval :> ISQ::time;
		attribute maxUpdateInterval :> ISQ::time = 10 [min];

		require constraint { actualUpdateInterval <= maxUpdateInterval }
		#refinement dependency 'HLR-R048' to CapabilitiesPackage::RealtimeMissionControl;
	}

	requirement def <'HLR-R049'> LunarLanderAscentReadinessTime {
		doc /* The Apollo 11 Mission's lunar lander's ascent stage shall be capable of launching from the lunar surface
			within 24 hours of landing, to align with rendezvous opportunities in lunar orbit. */
		@Rationale {
			text = "A limited readiness time for ascent ensures the crew can depart the lunar surface within favorable orbital mechanics windows for rendezvous, crucial for their return.";
		}

		attribute actualTimeFromLandingToAscentLaunch :> ISQ::time;
		attribute maxTimeToAscentLaunch :> ISQ::time = 24 [h];

		require constraint { actualTimeFromLandingToAscentLaunch <= maxTimeToAscentLaunch }
		#refinement dependency 'HLR-R049' to CapabilitiesPackage::LunarSurfaceLandingAndAscent;
	}

	requirement def <'HLR-R050'> FlightSoftwareUpdateTime {
		doc /* Apollo 11 Mission Control shall be able to reconfigure and uplink flight software updates
			to the spacecraft's primary computers within 1 hour in response to critical in-flight anomalies. */
		@Rationale {
			text = "The ability to rapidly update flight software in-flight provides a vital corrective capability to address unforeseen bugs or adapt to changing mission conditions.";
		}

		attribute actualSoftwareUpdateDuration :> ISQ::time;
		attribute maxSoftwareUpdateDuration :> ISQ::time = 1 [h];

		require constraint { actualSoftwareUpdateDuration <= maxSoftwareUpdateDuration }
		#refinement dependency 'HLR-R050' to CapabilitiesPackage::ComplexSoftwareDevelopment;
	}

	requirement def <'HLR-R052'> CrewEmergencyMedicalProficiency {
		doc /* The Apollo 11 Mission crew shall demonstrate proficiency in emergency medical procedures
			to handle common in-flight illnesses or minor injuries without external assistance for up to 72 hours. */
		@Rationale {
			text = "Crew self-sufficiency in basic medical emergencies is essential given the vast distances and isolation of lunar missions, where immediate external medical aid is impossible.";
		}

		attribute medicalProficiencyScore: Real;
		attribute minMedicalProficiencyScore: Real = 90;

		attribute externalAssistanceRequiredBeforeTime :> ISQ::time;
		attribute minSelfSufficiencyDuration :> ISQ::time = 72 [h];

		require constraint {
			(medicalProficiencyScore >= minMedicalProficiencyScore) and
			(externalAssistanceRequiredBeforeTime >= minSelfSufficiencyDuration)
		}
		#refinement dependency 'HLR-R052' to CapabilitiesPackage::CrewTrainingAndSimulation;
	}

	requirement def <'HLR-R053'> InFlightProcedureErrorRate {
		doc /* The Apollo 11 Mission crew shall be capable of performing all critical in-flight procedures (e.g., docking, re-entry preparation)
			with an error rate of <= 0.5% under nominal conditions. */
		@Rationale {
			text = "A very low error rate for critical procedures is paramount for mission success and crew safety, as failures in these steps could have catastrophic consequences.";
		}

		attribute actualProcedureErrorRate: RatioValue;
		attribute maxProcedureErrorRate: RatioValue = 0.5['%'];

		require constraint { actualProcedureErrorRate <= maxProcedureErrorRate }
		#refinement dependency 'HLR-R053' to CapabilitiesPackage::HumanPerformanceUnderExtremeStress;
	}

	requirement def <'HLR-R054'> CrewNutritionAndHydration {
		doc /* Apollo 11 Mission astronauts shall be able to consume all provided food and water
			throughout the mission without experiencing significant gastrointestinal issues or nutrient deficiencies. */
		@Rationale {
			text = "Adequate nutrition and hydration are fundamental for maintaining astronaut health, energy levels, and cognitive function throughout the demanding mission.";
		}

		attribute significantGIIssuesExperienced: Boolean;
		attribute nutrientDeficienciesObserved: Boolean;

		require constraint {
			not significantGIIssuesExperienced and
			not nutrientDeficienciesObserved
		}
		#refinement dependency 'HLR-R054' to CapabilitiesPackage::DeepSpaceHabitationAndLifeSupport;
	}

	requirement def <'HLR-R055'> CrewPsychologicalState {
		doc /* The Apollo 11 Mission crew shall maintain a positive psychological state as assessed by structured psychological evaluations
			throughout the mission. */
		@Rationale {
			text = "Crew psychological well-being is vital for effective teamwork, decision-making, and overall mission performance, especially during long periods of isolation and stress.";
		}

		attribute actualPsychologicalStateScore: Real; // e.g., on a positive/negative scale (0-100)
		attribute minPsychologicalStateScore: Real = 75;

		require constraint { actualPsychologicalStateScore >= minPsychologicalStateScore }
		#refinement dependency 'HLR-R055' to CapabilitiesPackage::HumanPerformanceUnderExtremeStress;
	}

	requirement def <'HLR-R057'> MicrometeoroidPenetrationRisk {
		doc /* The Apollo 11 Mission spacecraft shall be designed to minimize micro-meteoroid penetration risk
			to critical habitable volumes to less than 1 event in 1,000 missions. */
		@Rationale {
			text = "Minimizing micrometeoroid penetration risk is a key safety requirement to protect the crew and critical systems from space debris impacts that could cause depressurization or damage.";
		}

		attribute actualPenetrationProbabilityPerMission: Real; // Represents a probability (0-1)
		attribute maxAcceptablePenetrationProbability: Real = 0.001; // 1/1000

		require constraint { actualPenetrationProbabilityPerMission <= maxAcceptablePenetrationProbability }
		#refinement dependency 'HLR-R057' to CapabilitiesPackage::DeepSpaceHabitationAndLifeSupport;
	}

	requirement def <'HLR-R059'> LunarElementEnvironmentalResistance {
		doc /* All external mission elements left on the lunar surface by the Apollo 11 Mission shall be designed to withstand lunar thermal cycles
			(approx. +/- 150°C) and lunar dust exposure for a minimum of 3 months while maintaining structural integrity. */
		@Rationale {
			text = "Ensuring the long-term survival of deployed lunar elements in the harsh lunar environment is crucial for extended scientific data collection and mission legacy.";
		}

		attribute structuralIntegrityMaintained: Boolean;
		attribute minResistanceDuration :> ISQ::time;
		require constraint { structuralIntegrityMaintained } // Assuming tested duration meets minResistanceDuration
		#refinement dependency 'HLR-R059' to CapabilitiesPackage::ScientificDataAcquisitionAndSampleReturn;
	}

	requirement def <'HLR-R060'> PostFlightDataArchiving {
		doc /* The Apollo 11 Mission shall ensure post-flight data retention and archiving of all telemetry, voice, video,
			and scientific data, maintaining 99.99% data availability for future analysis for a minimum of 50 years. */
		@Rationale {
			text = "Long-term data archiving ensures that valuable mission data is preserved for future scientific research, engineering analysis, and historical purposes, benefiting future generations.";
		}

		attribute actualDataAvailabilityPercentage: RatioValue;
		attribute minDataAvailabilityPercentage: RatioValue = 99.99['%'];

		attribute actualArchivalDuration :> ISQ::time;
		attribute minArchivalDuration :> ISQ::time = 50 ['yr'];

		require constraint {
			(actualDataAvailabilityPercentage >= minDataAvailabilityPercentage) and
			(actualArchivalDuration >= minArchivalDuration)
		}
		#refinement dependency 'HLR-R060' to CapabilitiesPackage::ComplexLogisticsAndIntegration;
	}

    requirement def <'HLR-R061'> PropulsionSystemMissionReliability {
        doc /* The mission's major maneuvers shall be executed using highly reliable propulsive systems 
               to ensure mission success and return. */
        @Rationale {
            text = "Failure during critical maneuvers like LOI or TEI would leave the crew stranded. Engine systems must be highly predictable.";
        }
        #refinement dependency 'HLR-R061' to CapabilitiesPackage::InSpacePropulsion;
    }

    requirement def <'HLR-R062'> MechanicalLoadResilience {
        doc /* All primary structures shall withstand the flight environment without compromising 
               mission functionality. */
        @Rationale {
            text = "The spacecraft must survive extreme mechanical stresses during launch and reentry to protect internal subsystems.";
        }
        #refinement dependency 'HLR-R062' to CapabilitiesPackage::HeavyLiftLaunch;
    }

    requirement def <'HLR-R063'> LiveVisualBroadcast {
        doc /* The mission shall provide a live visual record of lunar surface operations to satisfy 
               public and scientific return goals. */
        @Rationale {
            text = "Real-time coverage is vital for fulfilling national prestige and providing visual context for Mission Control.";
        }
        #refinement dependency 'HLR-R063' to CapabilitiesPackage::RobustCommunicationAndTelemetry;
    }

    requirement def <'HLR-R064'> ExtendedScientificOperation {
        doc /* Deployed lunar elements shall remain operational post-landing to provide 
               long-term data return. */
        @Rationale {
            text = "Scientific value is maximized by instruments that continue to collect data long after the crew departs.";
        }
        #refinement dependency 'HLR-R064' to CapabilitiesPackage::ScientificDataAcquisitionAndSampleReturn;
    }

    requirement def <'HLR-R065'> CriticalSystemAvailability {
        doc /* All mission-critical systems shall be designed for maximum uptime to prevent 
               catastrophic mission loss. */
        @Rationale {
            text = "High availability is the cornerstone of safety, ensuring that single-point failures do not result in the loss of crew or spacecraft.";
        }
        #refinement dependency 'HLR-R065' to CapabilitiesPackage::ComplexLogisticsAndIntegration;
    }	

	requirement def <'HLR-R066'> PublicSupportAndAffairsManagement {
		doc /* The Apollo 11 program shall maintain a public affairs office to provide real-time updates and 
		       educational materials to the global public, ensuring a favorable public opinion rating of 
		       at least 60% throughout the mission duration. */
		@Rationale {
			text = "Sustained political and public support is necessary to maintain the massive financial commitment required for the program's existence.";
		}
		#refinement dependency 'HLR-R066' to CapabilitiesPackage::ProgrammaticAndPublicAffairsManagement;
	}

	requirement def <'HLR-R067'> ElectricalPowerAvailability {
		doc /* The spacecraft electrical power system shall provide a continuous supply of regulated DC power 
		       to all primary bus systems, maintaining a minimum of 25% energy reserve at all times 
		       during the nominal mission profile. */
		@Rationale {
			text = "Reliable power distribution is fundamental to the operation of all other spacecraft systems and is a prerequisite for mission success.";
		}
		#refinement dependency 'HLR-R067' to CapabilitiesPackage::PowerGenerationAndDistribution;
	}

	requirement def <'HLR-R068'> LaunchWindowPrecision {
		doc /* Launch operations shall execute the final countdown and ignition sequence within a ±2.5-second 
		       launch window to ensure the spacecraft meets the required planetary alignment for the 
		       Trans-Lunar Injection. */
		@Rationale {
			text = "Precise management of ground-based launch activities is required to ensure the launch system places the spacecraft into the correct trajectory efficiently.";
		}
		#refinement dependency 'HLR-R068' to CapabilitiesPackage::LaunchOperationsManagement;
	}

	requirement def <'HLR-R069'> OperationalWorkaroundProtocol {
		doc /* The mission architecture shall provide the crew and ground controllers with 'workaround' 
		       protocols for all non-critical system anomalies, enabling mission continuation despite 
		       minor hardware or software deviations. */
		@Rationale {
			text = "The inherent human capacity to adjust to unexpected challenges is a critical safety function that allows for mission success when automated systems encounter unforeseen conditions.";
		}
		#refinement dependency 'HLR-R069' to CapabilitiesPackage::AdaptabilityAndProblemSolving;
	}

}