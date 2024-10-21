/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module proxy;
import std.stdio: writeln;
import std.typecons: Nullable;

@safe:

interface ISubject
{
    void request();
}

class RealSubject : ISubject
{
    void request()
    {
        writeln("RealSubject: Handling request.");
    }
}

class Proxy : ISubject
{
    private Nullable!RealSubject realSubject;

    this()
    {
        realSubject.nullify();
    }

    void request()
    {
        if (realSubject.isNull)
        {
            realSubject = Nullable!RealSubject(new RealSubject());
        }
        writeln("Proxy: Logging request before delegation.");
        realSubject.get.request();
        writeln("Proxy: Logging request after delegation.");
    }
}
