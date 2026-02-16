//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package ProgramPackage {
	
	private import MissionPackage::*;
	private import CoSMAPackage::*;
	private import AstronautsPackage::*;

	part def ApolloProgram :> Program {
		doc /* The Apollo program, also known as Project Apollo, was the United States human spaceflight program led by NASA, which landed the first humans on the Moon in 1969. */
		
		part apollo11 : Apollo11Mission :> missions;
		
		//https://en.wikipedia.org/wiki/Apollo_program
		part 'as-201' : Mission {
			doc /* First flight of Saturn IB and Block I CSM; suborbital to Atlantic Ocean; qualified heat shield to orbital reentry speed. */
		} :> missions;
		part 'as-203' : Mission {
			doc /* No spacecraft; observations of liquid hydrogen fuel behavior in orbit to support design of S-IVB restart capability. */
		} :> missions;
		part 'as-202' : Mission {
			doc /* Suborbital flight of CSM to Pacific Ocean. */
		} :> missions;
		part apollo1 : MannedSpaceMission {
			doc /* Not flown. All crew members died in a fire during a launch pad test on January 27, 1967. */
			individual part : 'Gus Grissom' :> crew;
			individual part : 'Ed White' :> crew;
			individual part : 'Roger B. Chaffee' :> crew; 			
		} :> missions;
		part apollo4 : Mission {
			doc /* First test flight of Saturn V, placed a CSM in a high Earth orbit; demonstrated S-IVB restart; qualified CM heat shield to lunar reentry speed. */
		} :> missions;
		part apollo5 : Mission {
			doc /* Earth orbital flight test of LM, launched on Saturn IB; demonstrated ascent and descent propulsion; human-rated the LM. No crew. */
		} :> missions;
		part apollo6 : Mission {
			doc /* Uncrewed, second flight of Saturn V, attempted demonstration of trans-lunar injection, and direct-return abort using SM engine; three engine failures, including failure of S-IVB restart. Flight controllers used SM engine to repeat Apollo 4's flight profile. Human-rated the Saturn V. */
		} :> missions;
		part apollo7 : MannedSpaceMission {
			doc /* First crewed Earth orbital demonstration of Block II CSM, launched on Saturn IB. First live television broadcast from a crewed mission. */
			individual part : 'Wally Schirra' :> crew;
			individual part : 'Walt Cunningham' :> crew;
			individual part : 'Donn Eisele' :> crew; 				
		} :> missions;
		part apollo8 : MannedSpaceMission {
			doc /* First crewed flight of Saturn V; First crewed flight to Moon; CSM made 10 lunar orbits in 20 hours. */
			individual part : 'Frank Borman' :> crew;
			individual part : 'James Lovell' :> crew;
			individual part : 'William Anders' :> crew; 				
		} :> missions;
		part apollo9 : MannedSpaceMission {
			doc /* Second crewed flight of Saturn V; First crewed flight of CSM and LM in Earth orbit; demonstrated portable life support system to be used on the lunar surface. */
			individual part : 'James McDivitt' :> crew;
			individual part : 'David Scott' :> crew;
			individual part : 'Russell Schweickart' :> crew; 				
		} :> missions;
		part apollo10 : MannedSpaceMission {
			doc /* Dress rehearsal for first lunar landing; flew LM down to 50,000 ft (15 km; 9.5 mi) from lunar surface. */
			individual part : 'Thomas Stafford' :> crew;
			individual part : 'John Young' :> crew;
			individual part : 'Eugene Cernan' :> crew; 				
		} :> missions;
		part apollo12 : MannedSpaceMission {
			doc /* Second landing, in Ocean of Storms near Surveyor 3. Surface EVA time: 7h 45m. Samples returned: 75.62 lb (34.30 kg). */
			individual part : 'Pete Conrad' :> crew;
			individual part : 'Richard Gordon' :> crew;
			individual part : 'Alan Bean' :> crew; 				
		} :> missions;
		part apollo13 : MannedSpaceMission {
			doc /* Third landing attempt aborted in transit to the Moon, due to SM failure. Crew used LM as "lifeboat" to return to Earth. Mission called a "successful failure". */
			individual part : 'James Lovell' :> crew;
			individual part : 'Jack Swigert' :> crew;
			individual part : 'Fred Haise' :> crew; 				
		} :> missions;
		part apollo14 : MannedSpaceMission {
			doc /* Third landing, in Fra Mauro formation. Surface EVA time: 9h 21m. Samples returned: 94.35 lb (42.80 kg). */
			individual part : 'Alan Shepard' :> crew;
			individual part : 'Stuart Roosa' :> crew;
			individual part : 'Edgar Mitchell' :> crew; 				
		} :> missions;
		part apollo15 : MannedSpaceMission {
			doc /* Fourth landing, in Hadley-Apennine. First extended mission, used Rover on Moon. Surface EVA time: 18h 33m. Samples returned: 169.10 lb (76.70 kg). */
			individual part : 'David Scott' :> crew;
			individual part : 'Alfred Worden' :> crew;
			individual part : 'James Irwin' :> crew; 				
		} :> missions;
		part apollo16 : MannedSpaceMission {
			doc /* Fifth landing, in Plain of Descartes. Second extended mission, used Rover on Moon. Surface EVA time: 20h 14m. Samples returned: 207.89 lb (94.30 kg). */
			individual part : 'John Young' :> crew;
			individual part : 'Ken Mattingly' :> crew;
			individual part : 'Charles Duke' :> crew; 				
		} :> missions;
		part apollo17 : MannedSpaceMission {
			doc /* Only Saturn V night launch. Sixth landing, in Taurus-Littrow. Third extended mission, used Rover on Moon. First geologist on the Moon. Apollo's last crewed Moon landing. Surface EVA time: 22h 2m. Samples returned: 243.40 lb (110.40 kg). */
			individual part : 'Eugene Cernan' :> crew;
			individual part : 'Ronald Evans' :> crew;
			individual part : 'Harrison Schmitt' :> crew; 				
		} :> missions;
		
	}

}