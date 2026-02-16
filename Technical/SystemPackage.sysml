//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package SystemPackage {
	
	private import TechnicalComponentsPackage::*;
	private import TechnicalIndividualsPackage::*;
	private import CoSMAPackage::*;
	private import TechnicalPortsPackage::*;
	
	part def Apollo11MissionSystem :> SystemOfSystems {
		individual part launchVehicle : 'SA-506' :> constituentSystems;
		
		part spacecraft : ApolloSpacecraft :> constituentSystems {
			individual part csm : 'CSM-107' :>> commandServiceModule;
			individual part lm: 'LM-5' :>> lunarModule;
		}
		
		part spaceSuits[2] : ExtravehicularMobilityUnit :> constituentSystems;
		
		interface lvToPayload : LVPayloadInterface connect
			launchVehicle.instrumentUnit.payloadInterfacePort to spacecraft.spacecraftLMAdapter.launchVehicleInterfacePort;
	}
}