//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

package AstronautsPackage {
	
	private import CoSMAPackage::*;
	private import ScalarValues::*;
	private import Time::*;
	
	individual part def 'Gus Grissom' :> Astronaut {
		doc /* Virgil "Gus" Grissom was one of the original Mercury Seven astronauts. He was the second American in space and the first person to fly in space twice. He was the commander of the ill-fated Apollo 1 mission and tragically died in the launch pad fire. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1926-04-03");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1967-01-27");
	}
	individual part def 'Ed White' :> Astronaut {
		doc /* Edward H. White II was the first American to perform a spacewalk, during the Gemini 4 mission. As Senior Pilot for the Apollo 1 mission, he died in the launch pad fire alongside his crewmates. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-11-14");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1967-01-27");
	}
	individual part def 'Roger B. Chaffee' :> Astronaut {
		doc /* A rookie astronaut selected for the first crewed low Earth orbital test of the Apollo spacecraft. He served as the Pilot for Apollo 1 and tragically died in the launch pad fire with his crew. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1935-02-15");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1967-01-27");
	}
	individual part def 'Wally Schirra' :> Astronaut {
		doc /* Walter "Wally" Schirra was the only astronaut to fly in all three of America's first human spaceflight programs: Mercury, Gemini, and Apollo. He commanded Apollo 7, the first crewed flight of the Apollo program. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1923-03-12");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2007-05-03");
	}
	individual part def 'Walt Cunningham' :> Astronaut {
		doc /* Walter Cunningham was a physicist and the Lunar Module Pilot on Apollo 7. This mission was a critical 11-day Earth-orbital test of the Apollo Command/Service Module, proving its space-worthiness. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1932-03-16");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2023-01-03");
	}
	individual part def 'Donn Eisele' :> Astronaut {
		doc /* Donn F. Eisele was the Command Module Pilot on Apollo 7, the first crewed flight of the Apollo spacecraft, which successfully tested the vehicle in Earth orbit. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-06-23");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1987-12-02");
	}
	individual part def 'Frank Borman' :> Astronaut {
		doc /* Frank Borman was the Commander of the Apollo 8 mission, the first crewed flight to orbit the Moon. This historic 1968 mission was a crucial step towards the lunar landing. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1928-03-14");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2023-11-07");
	}
	individual part def 'James Lovell' :> Astronaut {
		doc /* James "Jim" Lovell is one of only three men to have flown to the Moon twice. He flew on Apollo 8, the first mission to orbit the Moon, and was the Commander of the ill-fated Apollo 13 mission, which he and his crew safely returned to Earth after a major in-flight emergency. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1928-03-25");
	}
	individual part def 'William Anders' :> Astronaut {
		doc /* William "Bill" Anders was the Lunar Module Pilot on Apollo 8. He is famous for taking the iconic "Earthrise" photograph, showing the Earth rising above the lunar horizon. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1933-10-17");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2024-06-07");
	}
	individual part def 'James McDivitt' :> Astronaut {
		doc /* James McDivitt was the Commander of Gemini 4 and Apollo 9 (first flight of the Lunar Module). */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1929-06-10");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2022-10-13");
	}
	individual part def 'David Scott' :> Astronaut {
		doc /* David Scott flew on Gemini 8 and Apollo 9, and was the Commander of Apollo 15. As the seventh person to walk on the Moon, he was the first to drive the Lunar Roving Vehicle on the lunar surface. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1932-06-06");
	}
	individual part def 'Russell Schweickart' :> Astronaut {
		doc /* Russell "Rusty" Schweickart was the Lunar Module Pilot on Apollo 9. He performed the first extravehicular activity (EVA) of the Apollo program, testing the new spacesuit's life support system. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1935-10-25");
	}
	individual part def 'Thomas Stafford' :> Astronaut {
		doc /* Thomas Stafford was the Commander of Apollo 10, the final "dress rehearsal" mission that flew to the Moon and tested the Lunar Module in lunar orbit, descending to within 9 miles of the surface. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-09-17");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2024-03-18");
	}
	individual part def 'John Young' :> Astronaut {
		doc /* John Young had a long and distinguished career, flying in the Gemini, Apollo, and Space Shuttle programs. He was the Command Module Pilot on Apollo 10 and the Commander of Apollo 16, becoming the ninth person to walk on the Moon. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-09-24");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2018-01-05");
	}
	individual part def 'Eugene Cernan' :> Astronaut {
		doc /* Eugene "Gene" Cernan was one of three men to fly to the Moon twice, on Apollo 10 and Apollo 17. As Commander of Apollo 17, he was the last person to walk on the Moon. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1934-03-14");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2017-01-16");
	}
	individual part def 'Neil Armstrong' :> Astronaut {
		doc /* Neil Armstrong was the Commander of Apollo 11. A veteran of the Gemini program and a skilled test pilot, he became the first human to walk on the lunar surface on July 20, 1969. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-08-05");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2012-08-25");
	}
	individual part def 'Michael Collins' :> Astronaut {
		doc /* Michael Collins was the Command Module Pilot for Apollo 11. He remained in lunar orbit aboard the Command Module "Columbia" while his crewmates explored the surface, a critical role for their safe return. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-10-31");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2021-04-28");
	}
	individual part def 'Buzz Aldrin' :> Astronaut {
		doc /* Edwin "Buzz" Aldrin was the Lunar Module Pilot for Apollo 11. He joined Neil Armstrong on the lunar surface, becoming the second human to walk on the Moon. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-01-20");
	}
	individual part def 'Pete Conrad' :> Astronaut {
		doc /* Charles "Pete" Conrad Jr. was the Commander of Apollo 12, the second lunar landing mission. He was the third person to walk on the Moon. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-06-02");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1999-07-08");
	}
	individual part def 'Richard Gordon' :> Astronaut {
		doc /* Richard "Dick" Gordon Jr. was the Command Module Pilot for Apollo 12, orbiting the Moon while his crewmates landed in the Ocean of Storms. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1929-10-05");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2017-11-06");
	}
	individual part def 'Alan Bean' :> Astronaut {
		doc /* Alan Bean was the Lunar Module Pilot for Apollo 12, becoming the fourth person to walk on the Moon. After retiring from NASA, he became a renowned artist, painting scenes from the Apollo missions. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1932-03-15");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2018-05-26");
	}
	individual part def 'Jack Swigert' :> Astronaut {
		doc /* John "Jack" Swigert Jr. was the Command Module Pilot for the dramatic Apollo 13 mission. He was a late replacement for Ken Mattingly and played a key role in the crew's safe return. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1931-08-30");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1982-12-27");
	}
	individual part def 'Fred Haise' :> Astronaut {
		doc /* Fred Haise was the Lunar Module Pilot for Apollo 13. He was scheduled to be the sixth person to walk on the Moon before an in-flight emergency forced the mission to abort its landing. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1933-11-14");
	}
	individual part def 'Alan Shepard' :> Astronaut {
		doc /* Alan Shepard was one of the original Mercury Seven and the first American in space. After overcoming an inner-ear disorder, he commanded Apollo 14, becoming the fifth person to walk on the Moon, where he famously hit two golf balls. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1923-11-18");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1998-07-21");
	}
	individual part def 'Stuart Roosa' :> Astronaut {
		doc /* Stuart Roosa was the Command Module Pilot for Apollo 14. He carried hundreds of tree seeds into lunar orbit as part of a joint project with the U.S. Forest Service. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1933-08-16");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1994-12-12");
	}
	individual part def 'Edgar Mitchell' :> Astronaut {
		doc /* Edgar Mitchell was the Lunar Module Pilot for Apollo 14 and the sixth person to walk on the Moon, exploring the Fra Mauro formation. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-09-17");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2016-02-04");
	}
	individual part def 'Alfred Worden' :> Astronaut {
		doc /* Alfred Worden was the Command Module Pilot for Apollo 15. During the return journey from the Moon, he performed the first-ever deep-space extravehicular activity (EVA). */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1932-02-07");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2020-03-18");
	}
	individual part def 'James Irwin' :> Astronaut {
		doc /* James Irwin was the Lunar Module Pilot for Apollo 15 and the eighth person to walk on the Moon. He was one of the first to explore the lunar mountains and drive the Lunar Roving Vehicle. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1930-03-17");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1991-08-08");
	}
	individual part def 'Ken Mattingly' :> Astronaut {
		doc /* Thomas Kenneth "Ken" Mattingly II was famously removed from the Apollo 13 crew due to exposure to measles but later served as the Command Module Pilot for Apollo 16, orbiting the Moon during the mission. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1936-03-17");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("2023-10-31");
	}
	individual part def 'Charles Duke' :> Astronaut {
		doc /* Charles Duke served as the CAPCOM for Apollo 11, and his voice was heard by millions during the landing. He later flew as the Lunar Module Pilot for Apollo 16, becoming the tenth person to walk on the Moon. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1935-10-03");
	}
	individual part def 'Ronald Evans' :> Astronaut {
		doc /* Ronald Evans was the Command Module Pilot for Apollo 17. During the return flight from the Moon, he performed an EVA to retrieve film cassettes from the Service Module, which was the last deep-space EVA of the Apollo program. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1933-11-10");
		attribute dateOfDeath: Iso8601DateTime = new Iso8601DateTime("1990-04-07");
	}
	individual part def 'Harrison Schmitt' :> Astronaut {
		doc /* Harrison "Jack" Schmitt was the Lunar Module Pilot for Apollo 17. As a professional geologist, he was the only scientist to walk on the Moon and the twelfth person to do so. */
		attribute dateOfBirth: Iso8601DateTime = new Iso8601DateTime("1935-07-03");
	}
}