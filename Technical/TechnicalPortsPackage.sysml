//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package TechnicalPortsPackage {
	
	private import SI::*;
	private import ISQ::*;

	item def StructuralLoad { doc /* Represents the transfer of physical forces (compression, tension, torsion). */ }
	item def CommandSignal { doc /* Represents a discrete command or electrical signal. */ }
	item def TelemetryData { doc /* Represents a flow of vehicle health and status data. */ }
	item def ElectricalPower { doc /* Represents a flow of electrical energy. */ }
	item def LifeSupportFlows { doc /* Represents a flow of oxygen, water, and thermal control fluids. */ }

	port def PayloadInterfacePort {
		doc /* Defines the connection point on the launch vehicle that structurally supports and electrically interfaces with the spacecraft payload before separation. */
		inout item loads : StructuralLoad;
		out item commands : CommandSignal;
		in item telemetry : TelemetryData;
		out item power : ElectricalPower;
	}

	port def StagingPort {
		doc /* A single definition for a staging interface port, viewed from the 'source' (lower) stage. */
		inout item loads : StructuralLoad;
		out item commands : CommandSignal;
	}
	
	port def ControlPort {
		doc /* A single definition for a guidance interface port, viewed from the 'controller' (e.g., Instrument Unit). */
		out item guidanceCmds : CommandSignal;
		out item thrustCmds : CommandSignal;
		in item telemetry : TelemetryData;
		out item power : ElectricalPower;
	}

	port def UmbilicalPort {
		doc /* A single definition for an umbilical port, viewed from the 'supplier' (e.g., Service Module). */
		out item power : ElectricalPower;
		out item lifeSupport : LifeSupportFlows;
		out item dataAndControl : CommandSignal;
	}
	
	port def DockingPort {
		doc /* A symmetric port for docking, where flows can be bidirectional. */
		inout item loads : StructuralLoad;
		inout item power : ElectricalPower;
		inout item data : TelemetryData;
	}

	port def LMStagingPort {
		doc /* A single definition for the Lunar Module staging port, viewed from the 'platform' (Descent Stage). */
		inout item loads : StructuralLoad;
		out item commands : CommandSignal;
		out item powerAndData : ElectricalPower;
	}
	
	port def EVAUmbilicalPort {
		doc /* A single definition for the spacesuit umbilical, viewed from the 'supplier' (the PLSS backpack). */
		out item lifeSupport : LifeSupportFlows;
		out item power : ElectricalPower;
		inout item commsAndData : TelemetryData;
	}
	
	port def LaunchEscapeSystemPort {
		doc /* Defines the connection point on the Command Module that supports and controls the LES. */
		inout item loads : StructuralLoad;
		out item abortSignal : CommandSignal;
		out item jettisonSignal : CommandSignal;
	}
	
	interface def StagingInterface {
		doc /* Defines the contract for a connection between two rocket stages. */
		end source : StagingPort;
		end target : ~StagingPort;
	}
	
	interface def GuidanceInterface {
		doc /* Defines the contract for a connection between a controller (IU) and a controlled component (S-IVB). */
		end controller : ControlPort;
		end controlled : ~ControlPort;
	}
	
	interface def CSMInterface {
		doc /* Defines the contract for the umbilical connection between the Command and Service Modules. */
		end supplier : UmbilicalPort;
		end consumer : ~UmbilicalPort;
	}
	
	interface def DockingInterface {
		doc /* Defines the contract for a symmetric docking connection between two vehicles. */
		end vehicle1 : DockingPort;
		end vehicle2 : DockingPort;
	}
	
	interface def LMStagingInterface {
		doc /* Defines the contract for the connection between the two stages of the Lunar Module. */
		end platform : LMStagingPort;
		end ascender : ~LMStagingPort;
	}
	
	interface def EVAInterface {
		doc /* Defines the contract for the connection between the spacesuit and its life support backpack. */
		end plss : EVAUmbilicalPort;
		end psa : ~EVAUmbilicalPort;
	}	
	
	interface def LVPayloadInterface {
		doc /* Defines the contract for the primary connection between the launch vehicle (Instrument Unit) and the spacecraft payload (SLA). */
		end launchVehicle : PayloadInterfacePort;
		end payload : ~PayloadInterfacePort;
	}	
	
	interface def LESInterface {
		doc /* Defines the contract for the connection between the Command Module and the Launch Escape System. */
		end commandModule : LaunchEscapeSystemPort;
		end launchEscapeSystem : ~LaunchEscapeSystemPort;
	}	

}