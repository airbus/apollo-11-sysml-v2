

# Apollo 11 SysML v2
This model represents a comprehensive, multi-layered SysML v2 implementation of the Apollo 11 mission. It demonstrates the application of the CoSMA (Complex System Modeling and Architecting) framework to a complex, real-world SoS. The result is a concrete example of how SysML v2 can be used to create detailed, traceable, and integrated system models. Both the Apollo 11 mission model and the COSMA framework are provided as a dedicated research artifact developed by Airbus Central R&T. The COSMA framework is presented here as representative "scaffolding" required to test the language's expressive power and is not intended to serve as a fully elaborated or universal industrial standard.

![Apollo 11 Launch](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Apollo_11_Launch2.jpg/500px-Apollo_11_Launch2.jpg)

By design, this model is not complete; it is intended to serve as a foundational **scaffold**. We have established the high-level architecture, key components, and primary traceability chains, but deliberately left areas for more detailed expansion. We believe this approach provides a robust starting point without being overly prescriptive, inviting other researchers and practitioners to fill these gaps and complete the model over time.

![Apollo 11 Insignia](https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Apollo_11_insignia.png/500px-Apollo_11_insignia.png)

We invite researchers, educators, tool vendors, and practitioners to utilize, critique, and contribute to this model.

## License
Refer to [LICENCE](./LICENSE.md) file.

## Contributing
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**. For detailed contributing guidelines, please see [CONTRIBUTING.md](CONTRIBUTING.md)

# Model Documentation
## 1. Introduction
The model's primary purpose is twofold:

1.  To serve as a substantial, non-trivial case study to evaluate the expressive power, features, and utility of the SysML v2 language against a complex, real-world System-of-Systems (SoS). 
2.  To provide a foundational, open-source artifact for the MBSE community, serving as a common reference, an educational resource, and a benchmark for the development of next-generation MBSE tools.

The model is structured using the five-layer CoSMA (Purpose, Operational, Functional, Logical, Technical) framework, which provides a disciplined, layered approach to the system's decomposition. This documentation details the implementation of each layer, the cross-cutting concerns that integrate the model, and the assumptions made during its construction.

## 2. Model Architecture and Methodology
The model's architecture is guided by the CoSMA framework and implemented using a lightweight, standards-compliant approach.

### 2.1. The CoSMA Framework
The CoSMA framework provides a structured abstraction, decomposing the system into five distinct but interconnected layers of concern. This separation allows modelers to address different aspects of the system at the appropriate level of detail.

-   **Purpose Layer:** Defines the system's core purpose. It answers the fundamental question: "Why does this system exist?"
-   **Operational Layer:** Models the mission from a dynamic, time-based perspective. It answers the question: "When do things happen and in what sequence?"
-   **Functional Layer:** Delivers an implementation-agnostic description of the system's required functions. It answers the question: "What does the system need to do?"
-   **Logical Layer:** Bridges the functional and physical domains, grouping functions into abstract components. It answers the question: "What abstract parts are responsible for which functions?"
-   **Technical Layer:** Represents the concrete physical implementation of the system. It answers the question: "How is the system physically built?"
    

### 2.2. Implementation Strategy
A core design decision was to rely on standard, built-in SysML v2 features to ensure the model remains tool-agnostic and universally accessible. Rather than creating a heavy, formal profile with user-defined stereotypes or metadata, the model employs a lightweight approach.

A central `CoSMAPackage` contains a library of base definitions for key architectural concepts (e.g., `HardwareComponent`, `Mission`, `Stakeholder`). Elements throughout the model then specialize from these base types using standard subclassification (`:>`). This strategy provides the necessary methodological scaffolding and consistency of the CoSMA framework without modifying the language itself, ensuring any standards-compliant tool can parse and utilize the model.

### 2.3. Resulting Metamodel
Our implementation decisions result in the guiding metamodel that defines the primary element types and the key relationships between them. It is important to note that any visual representation of this metamodel is intentionally simplified for readability; not all relations are shown. The following table provides a complete list of these metamodel elements, their descriptions, and the specific SysML v2 basetype used to implement them.

|Metamodel Element|Description|SysML v2 Basetype|
|--|--|--|
|**Program**|The overarching endeavor, which consists of multiple missions (e.g., the Apollo Program).|`part`|
|**Stakeholder**|An individual, group, or organization with an interest in the mission (e.g., `NASA`).|`part`|
|**Concern**|The high-level interests or worries of a Stakeholder (e.g., "Astronaut Safety").|`item`|
|**Stakeholder Need**|A formal requirement derived from a Stakeholder's concern (e.g., `CrewSurvival`).|`requirement`|
|**Capability**|A high-level ability required to meet goals and needs (e.g., `HeavyLiftLaunch`).|`part`|
|**Mission**|A specific, bounded endeavor within a Program (e.g., `Apollo11Mission`).|`part`|
|**Goal**|The high-level, primary objectives of a Mission (e.g., `goToMoon`).|`requirement`|
|**Mission Requirement**|A high-level requirement that refines a Capability and Goal (e.g., `LunarLanderSoftLandingRequirement`).|`requirement`|
|**Mission Specification**|A container that groups Mission Requirements and links them to the Mission via `satisfy` relationships.|`requirement`|
|**Context**|The environment and external systems in which the Mission System operates.|`part`|
|**External System**|A system within the Context, outside the Mission System (e.g., `MissionControl`).|`part`|
|**Mission System**|The complete System-of-Systems developed to execute the mission (e.g., `Apollo11MissionSystem`).|`part`|
|**Technical Component**|A concrete physical or software part of the Mission System (e.g., `ApolloCommandModule`).|`part`|
|**Logical Component**|An abstract grouping of functions, independent of physical implementation (e.g., `LaunchSystem`).|`part`|
|**Mission Phase**|A distinct, high-level stage of the mission timeline (e.g., `LaunchPhase`).|`state`|
|**Operation**|A high-level activity that occurs during a Mission Phase and is refined by a Function (e.g., `ExecuteLaunchSequence`).|`action`|
|**Mission Function**|The top-level function that the Mission performs (e.g., `PerformLunarMission`).|`action`|
|**Function**|A specific behavior or task the system must perform (e.g., `ProvideStage1Thrust`).|`action`|
|**Functional Requirement**|A requirement that specifies a behavior or function (e.g., `Stage1ThrustInitiationRequirement`).|`requirement`|
|**Function Specification**|A container that groups Functional Requirements and links them to Functions via `satisfy` relationships.|`requirement`|
|**Technical Requirement**|A requirement that specifies a technical characteristic of a System Component (e..g., `SICEngineConfiguration`).|`requirement`|
|**System Specification**|A container that groups Technical Requirements and links them to the Mission System via `satisfy` relationships.|`requirement`|
|**Mission Report**|An artifact that describes the outcome of the Mission.|`individual part`|

## 3. Model Implementation by Layer
The following sections detail the specific implementation of each CoSMA layer within the SysML v2 model.

### 3.1. Purpose Layer
This layer establishes the "why" of the system. It is defined across several packages:

-   **`StakeholderPackage`**: Defines the key stakeholders as `part defs` specializing from a base `Stakeholder` type (e.g., `NASA`, `Apollo11Crew`). Each stakeholder owns their high-level `Concerns` as `item defs`.
-   **`StakeholderNeedsPackage`**: Formalizes the stakeholders' concerns into verifiable `requirement defs` (e.g., `<'SHN-N002'> AstronautSafety`).
-   **`CapabilitiesPackage`**: Defines the high-level abilities the system must possess as `part defs` (e.g., `HeavyLiftLaunch`, `DeepSpaceHabitationAndLifeSupport`).
-   **`MissionPackage`**: Defines the `Apollo11Mission` itself. This `part def` contains the primary mission `Goals` (as `requirement defs`) and traces relationships between goals and the capabilities required to achieve them.

### 3.2. Operational Layer
This layer models the "when" of the mission. It is defined in the `MissionPhasesPackage` and the `OperationsPackage`.

-   **`MissionPhasesPackage`**: This package defines the 13 major mission phases (e.g., `LaunchPhase`, `PoweredDescentPhase`) as `state defs`. These are composed into a single state machine within the `Apollo11Mission` definition using the `exhibit state` feature. Transitions between phases are explicitly modeled.
-   **`OperationsPackage`**: This package defines the high-level operational activities as `action defs` (e.g., `ExecuteTLIBurn`, `PerformLunarEVA`). Each `MissionPhase` state definition contains a `do action` that orchestrates a sequence of these operations, linking the timeline to the mission's activities.    

### 3.3. Functional Layer
This layer provides the implementation-neutral "what" of the system, defined in the `FunctionsPackage`.

-   A top-level function, `PerformLunarMission`, is defined as an `action def`.
-   This top-level function is recursively decomposed into a hierarchy of sub-functions (e.g., `ExecuteOutboundJourney`, `ConductLunarOperations`). 
-   The decomposition continues to leaf-level functions (e.g., `ProvideStage1Thrust`), which are also `action defs` with specified inputs and outputs.
-   Crucially, each leaf-level `Function` uses a `refines` relationship to trace back to a specific `Operation` in the Operational Layer, ensuring all functional behavior directly supports a required operational activity.   

### 3.4. Logical Layer
This layer models the abstract "who," allocating functions to implementation-neutral components. This is defined in the `LogicalComponentsPackage`.

-   Abstract `part defs` are defined based on their mission role and responsibility, not their physical form (e.g., `LaunchSystem`, `Spacecraft`, `GroundSupportSystem`, `Crew`).
-   The SysML v2 `perform` keyword creates the formal, verifiable allocation. Each logical component definition contains a list of functions it must execute. For example, the `LaunchSystem` part definition includes `perform action provideStage1Thrust`, formally linking the logical structure to the functional behavior.    

### 3.5. Technical Layer
This layer represents the concrete "how," specifying the physical hardware implementation. It is defined across several packages:

-   **`TechnicalComponentsPackage`**: Contains the `part defs` for all physical hardware components (e.g., `SaturnV`, `ApolloCommandModule`, `S-IC`, `'F-1'` engine). These definitions contain key performance parameters as attributes, such as `dryMass`, `thrust`, `powerLoad`, and `failureRate`, using the standardized quantities and units library.  
-   **`TechnicalPortsPackage`**: Defines the connection points (`port defs`) and connection contracts (`interface defs`) for the physical hardware. For example, it defines the `DockingPort` and the `DockingInterface` that specifies the contract for structural loads and power transfer between two docked vehicles.
-   **`TechnicalIndividualsPackage`**: Defines the specific, unique _instances_ of hardware using the `individual part def` keyword. This distinguishes the design of the `SaturnV` (`part def`) from the specific, as-flown vehicle `SA-506` (`individual part def`). 
-   **`SystemPackage`**: Composes the final `Apollo11MissionSystem`. This `SystemOfSystems` definition assembles the specific individuals (e.g., `individual part launchVehicle : 'SA-506'`) and connects them via their defined interfaces.

## 4. Cross-Cutting Concerns
Several key modeling concepts span multiple layers to integrate the model into a coherent whole.

### 4.1. Requirements and Traceability
A full traceability between layers is a primary objective of the model. This is achieved by separating requirement definitions from their usage, satisfaction and refinement.

-   **Requirement Definitions**: All `requirement defs` are centralized in the `Requirements` package, subdivided by domain (e.g., `MissionRequirementsPackage`, `FunctionalRequirementsPackage`). Each requirement is defined only once.
-   **Specification Packages**: Traceability is managed in dedicated `Specification` packages (e.g., `MissionSpecificationPackage`). These packages contain `requirement` usages that act as containers, grouping requirements for a specific `subject`.
-   **The Traceability Chain**: Inside these specifications, the `satisfy` relationship creates the formal link. For example:
    -   A **Mission Requirement** (e.g., `CrewReturnSafetyRequirement`) is satisfied by an **Operation** (e.g., `retrieveCrewAndCM`).      
    -   A **Functional Requirement** (e.g., `AscentGuidanceRequirement`) is satisfied by a **Function** (e.g., `GuideAscentTrajectory`).      
    -   A **Technical Requirement** (e.g., `CMHeatShield`) is satisfied by a **Technical Component** (e.g., `ApolloCommandModule`).

The `refines` relationship is also used extensively to trace decomposition, such as a `StakeholderNeed` being refined by a `Capability`, which is in turn refined by a `MissionRequirement`.

The requirements included in this model are **not** the original Apollo 11 historical requirements, but are instead representative examples based on historical data.

### 4.2. Analysis and Calculations
The model is designed to be directly analyzable - at least in parts. This is enabled by two key packages:

-   **`CalculationsPackage`**: This package contains reusable, low-level calculations as `calc defs`. These define formal equations, such as `calculateDeltaV` (the Tsiolkovsky rocket equation) and `calculatePowerMargin`.  
-   **`AnalysisPackage`**: This package defines high-level, verifiable analyses using the `analysis def` keyword. These analyses bind a specific `subject` (a part of the model) to a calculation. For example:    
    -   The `MissionCostAnalysis` takes the `Apollo11Mission` as its `subject` and uses the `sumCosts` calculation on its cost attributes.       
    -   The `SystemPowerAnalysis` takes a composite part (like `'CSM-107'`) as its `subject` and uses collection functions (`->collect`, `->sum`) to iterate over all its `subcomponents`, summing their `powerGenerated` and `powerLoad` attributes to find the total power margin.

This pattern makes analysis a first-class citizen of the model, directly executable by a compliant tool.

### 4.3. Mission Execution
The `Apollo11MissionExecutionPackage` models the _actual_ historical flight, as distinct from the _planned_ operational model.
-   An `individual part def` is created for the `Apollo11MissionIndividual`.
-   The `timeslice` keyword is used to define key periods and events of the mission (e.g., `liftoff`, `poweredDescent`).    
-   The `snapshot` keyword is used within a `timeslice` to capture the state of the system's attributes at a specific instant. For example, the `atT0` snapshot asserts that `missionTime = 0 [s]` and `velocity = 0 [m/s]`. This creates a verifiable log of the mission's execution.

## 5. Assumptions and Estimates

A primary objective of this model is to demonstrate the full breadth of SysML v2, including its powerful analysis capabilities. To this end, the model's architecture and traceability have been rigorously implemented. However, to enable the defined analyses, it was necessary to provide values for various technical and programmatic attributes.

The attribute values in this model fall into two distinct categories:

1.  **Sourced Data:** Values for key performance parameters are based on publicly available, credible sources, such as NASA documentation. This includes mass properties (`dryMass`, `grossMass`, `launchMass`), propulsion characteristics (`thrust`, `specificImpulse`), and mission timeline data (`plannedDuration`).
2.  **Postulated Data:** A number of attribute values have been estimated or postulated purely to demonstrate the model's analytical functions. These values are not based on historical data.

This distinction is critical. The focus of the model's analyses is on demonstrating the _method_ of calculation and integration, not on producing a historically accurate _result_. The postulated values serve as necessary placeholders to create a complete, analyzable model.

Key areas with postulated data include:
-   **`MissionCostAnalysis`**: All cost attributes (`researchAndDevelopmentCost`, `manufacturingCost`, `operationsCost`, `personnelCost`) are notional estimates. Their purpose is to demonstrate the `sumCosts` calculation and the `MissionCostAnalysis` definition.
-   **`SystemPowerAnalysis`**: All `powerGenerated` and `powerLoad` values for the various technical components are postulated. Their purpose is to demonstrate the `calculatePowerMargin` calculation and the use of iterative collection functions (`->sum`) in an analysis.
-   **`MissionReliabilityAnalysis`**: All `failureRate` attributes are assumed values. Their purpose is to provide the necessary inputs for the `calculateReliability` function and the `MissionReliabilityAnalysis` definition.

Users of this model should be aware of this distinction. While the system architecture and traceability are intended to be robust, the results of any analysis based on postulated data are illustrative only.

# Publication and Citation
More details can be found in the article `Fly me to the Moon - Modeling Apollo 11 using SysML v2`, which has been submitted to the INCOSE Systems Engineering Journal. The preprint version can be found on [ResearchGate](https://www.researchgate.net/publication/400516213_Fly_me_to_the_Moon_-_Modeling_Apollo_11_using_SysML_v2).

If you use this model, please cite it as below.
```bibtex
@article{Helle_Fly_me_to_the_Moon_Modeling_Apollo11_using_SysMLv2_2026,
author = {Helle, Philipp and Schramm, Gerrit},
doi = {TBD},
journal = {Submitted to INCOSE Systems Engineering},
month = TBD,
number = {TBD},
pages = {TBD},
title = {{Fly me to the Moon - Modeling Apollo 11 using SysML v2}},
volume = {TBD},
year = {unpublished}
}
```
# Contact
Philipp Helle - philipp.helle@airbus.com
Gerrit Schramm - gerrit.schramm@airbus.com

# References
The following references have been used to build the model.

Mission/Operations/Functions Ontology:
- [A Unified Mission Ontology Based on Systematic Integration of Interdisciplinary Concepts](https://www.mdpi.com/2079-8954/12/12/567)
- [Semantic-based systems engineering for digitalization of space mission design](https://www.frontiersin.org/journals/industrial-engineering/articles/10.3389/fieng.2024.1426074/full)
 
Apollo/Saturn:
- [Saturn V Step-by-Step](https://www.ibiblio.org/apollo/Documents/Saturn%20V%20Step-by-Step%20Final.pdf)
- [Saturn V: The birth of the moon rocket](https://radschool.org.au/magazines/Vol63/pdf/Saturn%20V.pdf)
- [Apollo 11 Mission Overview](https://www.nasa.gov/history/apollo-11-mission-overview/)
- [Saturn V Flight Manual](https://www.nasa.gov/wp-content/uploads/static/history/afj/ap12fj/pdf/a12_sa507-flightmanual.pdf)
- [Stages to Saturn](https://ntrs.nasa.gov/citations/19970009949)
- [Technical Information Summary - Apollo 11](https://www.nasa.gov/wp-content/uploads/static/history/afj/ap11fj/pdf/a11-techsum.pdf)
- [Apollo 11 Mission Documents](https://www.nasa.gov/history/afj/ap11fj/a11-documents.html)
- [Nasa Mission As-506 Apollo 11 Owners' Workshop Manual (1969 Including Saturn V, Cm-107, Sm-107, Lm-5)](https://archive.org/details/nasamissionas5060000rile)
- [NASA Saturn V Owners' Workshop Manual: 1967–1973 (Apollo 4 to Apollo 17 & Skylab)](https://www.amazon.de/NASA-Saturn-1967-1973-Apollo-Skylab/dp/0857338285/ref=sr_1_7?__mk_de_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=1IDZMV96PHOYP&dib=eyJ2IjoiMSJ9.ZBGK21OMtr-ToowGMq_ziHua6pJYOaCrhCCeOWuXOCt2ikPTXzHdkpBHu1-P6BWoXyPng9-E8Syy3-O-ehcZZBXSdBlHLRYM0EjU-q0Vw6WDuZhjBDQy9k1FP4fvzy36SJsF4gN3APivWTk2WbM3KZc-RQzKPyw8s2XbhsSJ1YtzpSe0Wh8OTW_uZ897crA2KsDljmfQf_E89XO-YZuKwXjXJBmt_cZrSuIxfVPgGSpaZ-2tE6OLTLBSdgXOjKKpDicU1YmsZhjGxNbLJ9X5dGsnQ33OsuVDYCxvsr_xWKo.nw1GZCJG9rQVwpeC7RG5RGMF1vsswLPp46XHcaTAuH8&dib_tag=se&keywords=saturn+v&qid=1752838835&sprefix=saturn+%2Caps%2C114&sr=8-7)
