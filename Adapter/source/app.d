/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import adapter;

void main() @safe
{
	writeln("Client: I can work just fine with the Target objects:");
	auto target = new ConcreteTarget();
	clientCode(target);

	writeln("\nClient: The Adaptee class has a weird interface. See, I don't understand it:");
	auto adaptee = new Adaptee();
	writeln("Adaptee: ", adaptee.specificRequest());

	writeln("\nClient: But I can work with it via the Adapter:");
	auto adapter = new Adapter(adaptee);
	clientCode(adapter);
}
