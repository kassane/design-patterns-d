/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import bridge;
public import std.stdio: writeln;

void main() @safe
{
	auto implementationA = new ConcreteImplementationA();
	auto abstraction = new Abstraction(implementationA);
	abstraction.operation.writeln; // UFCS

	auto implementationB = new ConcreteImplementationB();
	auto extendedAbstraction = new ExtendedAbstraction(implementationB);
	writeln(extendedAbstraction.operation);
}

/*
Output:

Base operation with: Here's the result on the platform A.
Extended operation with: Here's the result on the platform B.
*/
