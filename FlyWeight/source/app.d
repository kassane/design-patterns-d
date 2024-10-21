/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import flyweight;

void main() @safe
{
	auto factory = new CarFactory();
	factory.listFlyweights();

	addCarToPoliceDatabase(factory, "BMW", "M5", "red", "CL234IR", "James Doe");
	addCarToPoliceDatabase(factory, "BMW", "X1", "red", "CL234IR", "James Doe");
	factory.listFlyweights();
}

/*
Output:

FlyweightFactory: I have 5 flyweights:
BMW_M5_red
Chevrolet_Camaro2018_pink
BMW_X6_white
Mercedes Benz_C500_red
Mercedes Benz_C300_black

Client: Adding a car to database.
FlyweightFactory: Reusing existing flyweight.
Flyweight: Displaying shared ([ BMW , M5 , red ]) and unique ([ CL234IR , James Doe ]) state.

Client: Adding a car to database.
FlyweightFactory: Can't find a flyweight, creating new one.
Flyweight: Displaying shared ([ BMW , X1 , red ]) and unique ([ CL234IR , James Doe ]) state.

FlyweightFactory: I have 6 flyweights:
BMW_M5_red
Chevrolet_Camaro2018_pink
BMW_X6_white
BMW_X1_red
Mercedes Benz_C500_red
Mercedes Benz_C300_black
*/
