/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module templateMethod;
public import std.stdio: writeln;

@safe:

private abstract class AbstractClass
{
    void templateMethod()
    {
        writeln("AbstractClass says: I am doing the bulk of the work");
        operation1();
        writeln("AbstractClass says: But I let subclasses override some operations");
        operation2();
        hook1();
        writeln("AbstractClass says: But I am doing the bulk of the work anyway");
    }

    abstract void operation1();
    abstract void operation2();

    void hook1()
    {
    }
}

class ConcreteClass1 : AbstractClass
{
    override void operation1()
    {
        writeln("ConcreteClass1 says: Implemented Operation1");
    }

    override void operation2()
    {
        writeln("ConcreteClass1 says: Implemented Operation2");
    }
}

class ConcreteClass2 : AbstractClass
{
    override void operation1()
    {
        writeln("ConcreteClass2 says: Implemented Operation1");
    }

    override void operation2()
    {
        writeln("ConcreteClass2 says: Implemented Operation2");
    }

    override void hook1()
    {
        writeln("ConcreteClass2 says: Overridden Hook1");
    }
}

void clientCode(AbstractClass abstractClass)
{
    abstractClass.templateMethod();
}
