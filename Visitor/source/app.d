import visitor;
import std.sumtype;

void main()
{
	auto objectStructure = new ObjectStructure();
	objectStructure.addElement(new ConcreteElementA());
	objectStructure.addElement(new ConcreteElementB());

	auto visitor = new ConcreteVisitor();
	objectStructure.accept(visitor);

	// Using UFCS
	new ConcreteElementA().printElementInfo();
	new ConcreteElementB().printElementInfo();

	// Using std.sumtype for type-safe unions
	SumType!(ConcreteElementA, ConcreteElementB) sumTypeElement;
	sumTypeElement = new ConcreteElementA();
	sumTypeElement.match!(
		(ConcreteElementA _) => writeln("SumType contains ConcreteElementA"),
		(ConcreteElementB _) => writeln("SumType contains ConcreteElementB")
	);
}

/*
Output:

Visitor is processing ConcreteElementA: ConcreteElementA operation
Visitor is processing ConcreteElementB: ConcreteElementB operation
Element type: visitor.ConcreteElementA
Element type: visitor.ConcreteElementB
SumType contains ConcreteElementA
*/
