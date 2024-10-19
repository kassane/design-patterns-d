/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import mediator;
import std.algorithm: map;
import std.array: array;
import std.range: iota;

void main() @safe
{
	import std.conv: to;

	auto mediator = new ConcreteMediator();

	auto componentA = new ComponentA(mediator);
	auto componentB = new ComponentB(mediator);

	mediator.addComponent("A", componentA);
	mediator.addComponent("B", componentB);

	// Using D's range capabilities to generate events
	auto events = iota(1, 4).map!(i => "Event " ~ i.to!string).array;

	foreach (event; events)
	{
		componentA.send(event);
	}
}

/*
Output:
ComponentB received: Event 1
ComponentB received: Event 2
ComponentB received: Event 3
*/
