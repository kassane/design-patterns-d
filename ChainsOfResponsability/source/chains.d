/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module chains;
public import std.stdio: writefln, writeln;
import std.algorithm: canFind;

@safe:

interface Handler
{
    void setNext(Handler handler);
    void handle(string request);
}

// Concrete handlers
class AnimalHandler : Handler
{
    private Handler nextHandler;
    private string animalName;
    private string[] foodPreferences;

    this(string name, string[] preferences)
    {
        animalName = name;
        foodPreferences = preferences;
    }

    void setNext(Handler handler)
    {
        nextHandler = handler;
    }

    void handle(string request)
    {
        if (canHandle(request))
        {
            writefln("  %s: I'll eat the %s.", animalName, request);
        }
        else if (nextHandler !is null)
        {
            nextHandler.handle(request);
        }
        else
        {
            writefln("  %s was left untouched.", request);
        }
    }

    private bool canHandle(string request)
    {
        return foodPreferences.canFind(request);
    }
}

class Chain
{
    private Handler firstHandler;

    this(Handler[] handlers...)
    {
        if (handlers.length > 0)
        {
            firstHandler = handlers[0];
            foreach (i; 1 .. handlers.length)
            {
                handlers[i - 1].setNext(handlers[i]);
            }
        }
    }

    void handle(string request)
    {
        if (firstHandler !is null)
        {
            firstHandler.handle(request);
        }
    }

    override string toString()
    {
        string result = "Chain:";
        Handler current = firstHandler;
        while (current !is null)
        {
            result ~= " > " ~ (cast(AnimalHandler)current).animalName;
            current = (cast(AnimalHandler)current).nextHandler;
        }
        return result;
    }
}
