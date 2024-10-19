/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module prototype;

public import std.algorithm: map, each;
import std.array: array;

@safe:

interface Prototype(T)
{
    T clone();
}

class ConcretePrototype : Prototype!ConcretePrototype
{
    private string data;

    this(string data)
    {
        this.data = data;
    }

    // Implementation of clone method
    override ConcretePrototype clone()
    {
        return new ConcretePrototype(data);
    }

    @property string getData() const
    {
        return data;
    }

    @property void setData(string newData)
    {
        data = newData;
    }
}

class PrototypeManager(T : Prototype!T)
{
    private T[string] prototypes;

    void addPrototype(string key, T prototype)
    {
        prototypes[key] = prototype;
    }

    T getPrototype(string key)
    {
        return prototypes[key].clone();
    }

    auto getAllPrototypes()
    {
        return prototypes.values.map!(p => p.clone()).array;
    }
}
