/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import templateMethod;

void main() @safe
{
	writeln("Same client code can work with different subclasses:");
	clientCode(new ConcreteClass1());
	writeln();
	writeln("Same client code can work with different subclasses:");
	clientCode(new ConcreteClass2());
}

/*
Output:

Same client code can work with different subclasses:
AbstractClass says: I am doing the bulk of the work
ConcreteClass1 says: Implemented Operation1
AbstractClass says: But I let subclasses override some operations
ConcreteClass1 says: Implemented Operation2
AbstractClass says: But I am doing the bulk of the work anyway

Same client code can work with different subclasses:
AbstractClass says: I am doing the bulk of the work
ConcreteClass2 says: Implemented Operation1
AbstractClass says: But I let subclasses override some operations
ConcreteClass2 says: Implemented Operation2
ConcreteClass2 says: Overridden Hook1
AbstractClass says: But I am doing the bulk of the work anyway
*/
