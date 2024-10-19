import factory;

void main()
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
