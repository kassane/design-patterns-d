/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import prototype;
import std.stdio: writeln;

void main() @safe
{
	auto manager = new PrototypeManager!ConcretePrototype();

	// Adding prototypes
	manager.addPrototype("proto2", new ConcretePrototype("Original Data 2"));
	manager.addPrototype("proto1", new ConcretePrototype("Original Data 1"));

	// Cloning
	auto clone2 = manager.getPrototype("proto2");
	// Cloning and modifying
	auto clone1 = manager.getPrototype("proto1");
	clone1.setData("Modified Data 1");

	// Using string interpolation for output
	writeln("Clone 1 data: ", clone1.getData);
	writeln("Clone 2 data: ", clone2.getData);

	// Using UFCS and higher-order functions
	manager.getAllPrototypes
		.map!(p => p.getData)
		.each!writeln;
}

/*
Output:
Clone 1 data: Modified Data 1
Clone 2 data: Original Data 2
Original Data 1
Original Data 2
*/
