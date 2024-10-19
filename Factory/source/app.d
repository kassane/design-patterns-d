/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import factory;

void main() @safe
{
	// Using template-based factory
	auto templateFactory = new Factory!(ConcreteProductA, ConcreteProductB);
	auto productA = templateFactory.create("ConcreteProductA");
	productA.use();

	auto productB = templateFactory.create("ConcreteProductB");
	productB.use();

	// Using variant-based factory
	auto variantFactory = new VariantFactory();
	auto productC = variantFactory.create("ConcreteProductA");
	productC.use();

	auto productD = variantFactory.create("ConcreteProductB");
	productD.use();
}

/*
Output:

Using ConcreteProductA
Using ConcreteProductB
Using ConcreteProductA
Using ConcreteProductB
*/
