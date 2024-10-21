/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module bridge;

@safe:

interface Implementor
{
    string operationImpl();
}

// Concrete implementations
class ConcreteImplementationA : Implementor
{
    string operationImpl()
    {
        return "Here's the result on the platform A.";
    }
}

class ConcreteImplementationB : Implementor
{
    string operationImpl()
    {
        return "Here's the result on the platform B.";
    }
}

class Abstraction
{
    private Implementor implementor;

    this(Implementor impl)
    {
        implementor = impl;
    }

    string operation()
    {
        return "Base operation with: " ~ implementor.operationImpl();
    }
}

class ExtendedAbstraction : Abstraction
{
    this(Implementor impl)
    {
        super(impl);
    }

    override string operation()
    {
        return "Extended operation with: " ~ implementor.operationImpl();
    }
}
