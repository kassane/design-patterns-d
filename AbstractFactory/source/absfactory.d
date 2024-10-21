/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module absfactory;
public import std.stdio: writeln;
import std.typecons: Tuple;

@safe:

interface AbstractProductA
{
    string getResult();
}

interface AbstractProductB
{
    string getResult();
    string collaborate(AbstractProductA productA);
}

// Concrete Product implementations
class ConcreteProductA1 : AbstractProductA
{
    string getResult()
    {
        return "The result of the product A1.";
    }
}

class ConcreteProductA2 : AbstractProductA
{
    string getResult()
    {
        return "The result of the product A2.";
    }
}

class ConcreteProductB1 : AbstractProductB
{
    string getResult()
    {
        return "The result of the product B1.";
    }

    string collaborate(AbstractProductA productA)
    {
        return "The result of the B1 collaborating with the (" ~ productA.getResult() ~ ")";
    }
}

class ConcreteProductB2 : AbstractProductB
{
    string getResult()
    {
        return "The result of the product B2.";
    }

    string collaborate(AbstractProductA productA)
    {
        return "The result of the B2 collaborating with the (" ~ productA.getResult() ~ ")";
    }
}

interface AbstractFactory
{
    AbstractProductA createProductA();
    AbstractProductB createProductB();
}

// Concrete Factory implementations
class ConcreteFactory1 : AbstractFactory
{
    AbstractProductA createProductA()
    {
        return new ConcreteProductA1();
    }

    AbstractProductB createProductB()
    {
        return new ConcreteProductB1();
    }
}

class ConcreteFactory2 : AbstractFactory
{
    AbstractProductA createProductA()
    {
        return new ConcreteProductA2();
    }

    AbstractProductB createProductB()
    {
        return new ConcreteProductB2();
    }
}

void clientCode(AbstractFactory factory)
{
    auto productA = factory.createProductA();
    auto productB = factory.createProductB();

    writeln(productB.getResult());
    writeln(productB.collaborate(productA));
}
