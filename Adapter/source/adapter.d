/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module adapter;
public import std.stdio: writeln;
import std.algorithm: reverse;
import std.array: array;
import std.conv: to;

@safe:

// D class no have multi-inheritance support

interface Target
{
    string request();
}

class ConcreteTarget : Target
{
    string request()
    {
        return "Target: The default target's behavior.";
    }
}

class Adaptee
{
    string specificRequest()
    {
        return ".eetpadA eht fo roivaheb laicepS";
    }
}

class Adapter : Target
{
    private Adaptee adaptee;

    this(Adaptee adaptee)
    {
        this.adaptee = adaptee;
    }

    string request()
    {
        auto result = this.adaptee.specificRequest();
        return "Adapter: (TRANSLATED) " ~ result.dup.reverse.array.to!string;
    }
}

void clientCode(Target target)
{
    writeln(target.request());
}
