/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module visitor;
public import std.stdio;

@safe:

interface Element
{
    void accept(Visitor visitor);
}

// Concrete Element classes
class ConcreteElementA : Element
{
    void accept(Visitor visitor)
    {
        visitor.visit(this);
    }

    string operationA()
    {
        return "ConcreteElementA operation";
    }
}

class ConcreteElementB : Element
{
    void accept(Visitor visitor)
    {
        visitor.visit(this);
    }

    string operationB()
    {
        return "ConcreteElementB operation";
    }
}

interface Visitor
{
    void visit(ConcreteElementA element);
    void visit(ConcreteElementB element);
}

class ConcreteVisitor : Visitor
{
    void visit(ConcreteElementA element)
    {
        writeln("Visitor is processing ConcreteElementA: ", element.operationA());
    }

    void visit(ConcreteElementB element)
    {
        writeln("Visitor is processing ConcreteElementB: ", element.operationB());
    }
}

// ObjectStructure class to manage elements
class ObjectStructure
{
    private Element[] elements;

    void addElement(Element element)
    {
        elements ~= element;
    }

    void accept(Visitor visitor)
    {
        foreach (element; elements)
        {
            element.accept(visitor);
        }
    }
}

// Demonstrate the use of UFCS (Uniform Function Call Syntax)
void printElementInfo(T)(T element) if (is(T : Element))
{
    writeln("Element type: ", typeid(T).name);
}
