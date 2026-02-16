//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package TechnicalIndividualsPackage {

	private import TechnicalComponentsPackage::*;

	// https:>//en.wikipedia.org/wiki/Saturn_V
	individual part def 'SA-500F' :> SaturnV {
		doc /* Facilities integration. Used to check precise fits and test facilities operation on Pad 39A before a flight model was ready. First stage scrapped, second stage converted to S-II-F/D, third stage on display at Kennedy Space Center. */
	}	
	individual part def 'SA-500D' :> SaturnV {
		 doc /* Dynamic testing. Used to evaluate the vehicle's response to vibrations. On display at the U.S. Space & Rocket Center, Huntsville, Alabama. */
	}
	individual part def 'S-IC-T' :> SaturnV {
		doc /*  All Systems Test. First stage used for static test firing at Marshall Space Flight Center. On display at Kennedy Space Center. */	
	}
	individual part def 'SA-501' :> SaturnV {	
		doc /* Apollo 4 First uncrewed, all-up test flight. */
	}
	individual part def 'SA-502' :> SaturnV {
		doc /* Apollo 6. Second uncrewed test flight; J-2 engine problems caused early shutdown of two engines in second stage, and prevented third stage restart. */
	}
	individual part def 'SA-503' :> SaturnV {
		doc /* Apollo 8. First crewed flight; first trans-lunar injection of Apollo command and service module. */	
	}
	individual part def 'SA-504' :> SaturnV {
		doc /* Apollo 9. Crewed low Earth orbit test of complete Apollo spacecraft with the Lunar Module (LM). */	
	}
	individual part def 'SA-505' :> SaturnV {
		doc /* Apollo 10. Second crewed trans-lunar injection of complete Apollo spacecraft with LM; Only Saturn V launched from Pad 39B. */	
	}
	individual part def 'SA-506' :> SaturnV {
		doc /* Apollo 11. First crewed lunar landing, at Sea of Tranquility. */
	}
	individual part def 'SA-507' :> SaturnV {
		doc /* Apollo 12. Vehicle was struck twice by lightning shortly after liftoff, but did not suffer serious damage. Made second crewed lunar landing, near Surveyor 3 at Ocean of Storms*/
	}
	individual part def 'SA-508' :> SaturnV {
		doc /* Apollo 13. Severe pogo oscillations in second stage caused early center engine shutdown; guidance compensated by burning remaining engines longer. Lunar landing mission was aborted by service module failure. */
	}
	individual part def 'SA-509' :> SaturnV {
		doc /* Apollo 14. Third crewed lunar landing, near Fra Mauro, Apollo 13's intended landing site. */
	}
	individual part def 'SA-510' :> SaturnV {
		doc /* Apollo 15. Fourth crewed lunar landing, at Hadley-Apennine. First extended Apollo mission, carrying lunar orbital Scientific Instrument Module and Lunar Roving Vehicle. */	
	}
	individual part def 'SA-511' :> SaturnV {
		doc /* Apollo 16. Fifth crewed lunar landing, at Descartes Highlands. */
	}
	individual part def 'SA-512' :> SaturnV {
		doc /* Apollo 17. Only night launch. Sixth and final crewed lunar landing, at Taurus-Littrow. */
		}
	individual part def 'SA-513' :> SaturnV {
		doc /* Skylab 1. Uncrewed launch of the Skylab orbital workshop, which replaced the third stage, S-IVB-513, on display at Johnson Space Center. Originally designated for canceled Apollo 18. */
	}
	individual part def 'SA-514' :> SaturnV {	
		doc /* Unused. Originally designated for canceled Apollo 18 or 19; never used. It was proposed for launching an International Skylab. This station would have been serviced by Apollo, Soyuz and later by the Space Shuttle. The first stage (S-IC-14) on display at Johnson Space Center, second and third stage (S-II-14, S-IV-14) on display at Kennedy Space Center. The S-II interstage is located at Parque de las Ciencias in Puerto Rico. */
	}
	individual part def 'SA-515' :> SaturnV {
		doc /* Unused. Originally designated for Apollo 20, never used. Later it was proposed to launch the backup Skylab station into orbit sometime between January 1975 and April 1976. That way, it could expand the Apollo-Soyuz mission by 56-90 days. The first stage was on display at Michoud Assembly Facility, until June 2016 then was moved to the INFINITY Science Center in Mississippi. The second stage (S-II-15) is on display at Johnson Space Center. The third stage was converted to a backup Skylab orbital workshop and is on display at the National Air and Space Museum. */
	}

	// https:>//en.wikipedia.org/wiki/Apollo_command_and_service_module
	individual part def 'CSM-098' :> ApolloCommandServiceModule {
		doc /* 2TV-1 Used in thermal vacuum tests. CSM on display at Academy of Science Museum, Moscow, Russia as individual part def of the Apollo Soyuz Test Project display. */
	}
	individual part def 'CM-099' :> ApolloCommandServiceModule {
		doc /* 2S-1 Skylab flight crew interface training; impact tests. Scrapped */
	}
	individual part def 'CSM-100' :> ApolloCommandServiceModule {
		doc /* 2S-2 static structural testing. Command module "transferred to Smithsonian as an artifact", service module on display at New Mexico Museum of Space History */
	}
	individual part def 'CSM-101' :> ApolloCommandServiceModule {
		doc /* Apollo 7. Command module was on display at National Museum of Science and Technology, Ottawa, Ontario, Canada from 1974 until 2004, now at the Frontiers of Flight Museum, Dallas, Texas after 30 years of being on loan. */
	}	
	individual part def 'CSM-102' :> ApolloCommandServiceModule {
		doc /* Launch Complex 34 checkout vehicle. Command module scrapped; service module is at JSC on top of the Little Joe II in Rocket Park with Boiler Plate 22 command module. */
	}			
	individual part def 'CSM-103' :> ApolloCommandServiceModule {
		doc /* Apollo 8. Command module on display at the Museum of Science and Industry in Chicago */	
	}		
	individual part def 'CSM-104' :> ApolloCommandServiceModule {
		doc /* Gumdrop	Apollo 9. Command module on display at San Diego Air and Space Museum */
	}	
	individual part def 'CSM-105' :> ApolloCommandServiceModule {
		doc /* acoustic tests	On display at National Air and Space Museum, Washington, D.C. as individual part def of the Apollo Soyuz Test Project display. */
	}		
	individual part def 'CSM-106' :> ApolloCommandServiceModule {
		doc /* Charlie Brown	Apollo 10. Command module on display at Science Museum, London */
	}	
	individual part def 'CSM-107' :> ApolloCommandServiceModule {
		doc /* Columbia	Apollo 11. Command module on display at National Air and Space Museum, Washington, D.C.	*/
	}	
	individual part def 'CSM-108' :> ApolloCommandServiceModule {
		doc /* Yankee Clipper	Apollo 12. Command module on display at Virginia Air & Space Center, Hampton, Virginia; previously on display at the National Naval Aviation Museum at Naval Air Station Pensacola, Pensacola, Florida (exchanged for CSM-116) */
	}	
	individual part def 'CSM-109' :> ApolloCommandServiceModule {
		doc /* Odyssey	Apollo 13. Command module on display at Kansas Cosmosphere and Space Center */
	}
	individual part def 'CSM-110' :> ApolloCommandServiceModule {
		doc /* Kitty Hawk	Apollo 14. Command module on display at the Kennedy Space Center */
	}
	individual part def 'CSM-111' :> ApolloCommandServiceModule {
		doc /* Apollo Soyuz Test Project. Command module currently on display at California Science Center in Los Angeles, California (formerly displayed at the Kennedy Space Center Visitor Complex) */
	}			
	individual part def 'CSM-112' :> ApolloCommandServiceModule {
		doc /* Endeavour	Apollo 15. Command module on display at National Museum of the United States Air Force, Wright-Patterson Air Force Base, Dayton, Ohio */
	}
	individual part def 'CSM-113' :> ApolloCommandServiceModule {
		doc /* Casper	Apollo 16. Command module on display at U.S. Space & Rocket Center, Huntsville, Alabama */
	}
	individual part def 'CSM-114' :> ApolloCommandServiceModule {
		doc /* America	Apollo 17. Command module on display at Space Center Houston, Houston, Texas */
	}
	individual part def 'CSM-115' :> ApolloCommandServiceModule {
		doc /* Apollo 19. Never fully completed - service module does not have its SPS nozzle installed. On display as individual part def of the Saturn V display at Johnson Space Center, Houston, Texas */
	}	
	individual part def 'CSM-115a' :> ApolloCommandServiceModule {
		doc /* Apollo 20. Never fully completed - internal structures not installed, used for spare individual part defs. Remaining items sent to Japan for exhibition in 1978 and never returned, possibly scrapped. */
	}
	individual part def 'CSM-116' :> ApolloCommandServiceModule {
		doc /* Skylab 2. Command module on display at National Museum of Naval Aviation, Naval Air Station Pensacola, Pensacola, Florida */
	}
	individual part def 'CSM-117' :> ApolloCommandServiceModule {
		doc /* Skylab 3. Command module on display at Great Lakes Science Center, current location of the NASA Glenn Research Center Visitor Center, Cleveland, Ohio */
	}
	individual part def 'CSM-118' :> ApolloCommandServiceModule {
		doc /* Skylab 4.	Command module on display at Oklahoma History Center (formerly displayed at the National Air and Space Museum, Washington, D.C.) */
	}
	individual part def 'CSM-119' :> ApolloCommandServiceModule {
		doc /* Skylab Rescue and ASTP backup.	On display at the Kennedy Space Center*/
	}		

	// https:>//en.wikipedia.org/wiki/Apollo_Lunar_Module
	individual part def 'LTA-1' :> ApolloLunarModule {
		doc /* Not flown	Cradle of Aviation Museum (Long Island, New York) */
	}			
	individual part def 'LTA-2R' :> ApolloLunarModule {
		doc /* Apollo 6. Re-entered Earth's atmosphere */
	}			
	individual part def 'LTA-3A' :> ApolloLunarModule {
		doc /* Not flown. Kansas Cosmosphere and Space Center */
	}			
	individual part def 'LTA-3DR' :> ApolloLunarModule {
		doc /* Non-flight descent stage. Franklin Institute */
	}			
	individual part def 'LTA-5D' :> ApolloLunarModule {
		doc /* Not flown. White Sands Test Facility */
	}			
	individual part def 'LTA-8A' :> ApolloLunarModule {
		doc /* Thermal-vacuum tests	Ground tests in 1968	Space Center Houston */
	}			
	individual part def 'LTA-10R' :> ApolloLunarModule {
		doc /* Apollo 4. Re-entered Earth's atmosphere */
	}			
	individual part def 'MSC-16' :> ApolloLunarModule {
		doc /* Lunar Module Trainer. Museum of Science and Industry (Chicago) */
	}			
	individual part def 'TM-5' :> ApolloLunarModule {
		doc /* Non-flight. Museum of Life and Science (Durham, North Carolina) */
	}		
	individual part def 'PA-1' :> ApolloLunarModule {
		doc /* Not flown. White Sands Test Facility */
	}			
	individual part def 'LM-1' :> ApolloLunarModule {
		doc /* Apollo 5. Re-entered Earth's atmosphere */
	}			
	individual part def 'LM-2' :> ApolloLunarModule {
		doc /* Intended for second uncrewed flight, used instead for ground testing. Landing gear added for drop testing. Lacks Alignment Optical Telescope and flight computer National Air and Space Museum (Washington, D.C.) */
	}			
	individual part def 'LM-3' :> ApolloLunarModule {
		doc /* Spider, Apollo 9. Descent and ascent stages reentered Earth's atmosphere separately */
	}	
	individual part def 'LM-4' :> ApolloLunarModule {
		doc /* Snoopy, Apollo 10. Descent stage may have hit the Moon, ascent stage in heliocentric orbit. Snoopy is the only flown LM ascent stage known to have survived intact (possibly asteroid 2018 AV2). */
	}		
	individual part def 'LM-5' :> ApolloLunarModule {
		doc /* Eagle, Apollo 11. Descent stage on lunar surface in Sea of Tranquility, ascent stage left in lunar orbit (could be still orbiting the moon) */
	}	
	individual part def 'LM-6' :> ApolloLunarModule {
		doc /* Intrepid, Apollo 12. Descent stage on lunar surface at Ocean of Storms, ascent stage deliberately crashed into Moon */
	}	
	individual part def 'LM-7' :> ApolloLunarModule {
		doc /* Aquarius, Apollo 13. Successfully served as a lifeboat for the crew for four days after the critical failure of the Service module. Re-entered Earth's atmosphere and burned up over Fiji */
	}		
	individual part def 'LM-8' :> ApolloLunarModule {
		doc /* Antares, Apollo 14. Descent stage on lunar surface at Fra Mauro, ascent stage deliberately crashed into Moon */
	}		
	individual part def 'LM-9' :> ApolloLunarModule {
		doc /* Not flown, intended as Apollo 15, last H-class mission. On display at the Kennedy Space Center (Apollo/Saturn V Center) */
	}		
	individual part def 'LM-10' :> ApolloLunarModule {
		doc /* Falcon, Apollo 15. Descent stage on lunar surface at Hadley-Apennine, ascent stage deliberately crashed into Moon */
	}	
	individual part def 'LM-11' :> ApolloLunarModule {
		doc /* Orion, Apollo 16. Descent stage on lunar surface at Descartes Highlands, ascent stage left in lunar orbit, crashed on Moon*/
	}		
	individual part def 'LM-12' :> ApolloLunarModule {
		doc /* Challenger, Apollo 17. Descent stage on lunar surface at Taurus-Littrow, ascent stage deliberately crashed into Moon	*/
	}	
	individual part def 'LM-13' :> ApolloLunarModule {
		doc /* Not flown, intended as Apollo 19. individual part defially completed by Grumman, restored and on display at Cradle of Aviation Museum (Long Island, New York). Also used during 1998 miniseries From the Earth to the Moon. */        
	}		
	individual part def 'LM-14' :> ApolloLunarModule {
		doc /* Not flown, intended as Apollo 20.Incomplete, most likely scrapped */
	} 		
	individual part def 'LM-15' :> ApolloLunarModule {
		doc /* Not flown, intended for modification into Apollo Telescope Mount. Incomplete,scrapped */
	} 		
}