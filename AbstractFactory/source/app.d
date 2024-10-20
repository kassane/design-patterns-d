/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import absfactory;

void main() @safe
{
	writeln("Client: Testing client code with the first factory type:");
	clientCode(new ConcreteFactory1());

	writeln("\nClient: Testing the same client code with the second factory type:");
	clientCode(new ConcreteFactory2());
}

/*
Output:

Client: Testing client code with the first factory type:
The result of the product B1.
The result of the B1 collaborating with the (The result of the product A1.)

Client: Testing the same client code with the second factory type:
The result of the product B2.
The result of the B2 collaborating with the (The result of the product A2.)
*/
