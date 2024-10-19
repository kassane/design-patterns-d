/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module behavior;

public
{
    import std.algorithm;
    import std.range;
    import std.random;
    import std.stdio;
}

interface IBehavior
{
    void execute();
}

// Concrete behavior implementations
class JumpBehavior : IBehavior
{
    void execute()
    {
        writeln("Jumping!");
    }
}

class RunBehavior : IBehavior
{
    void execute()
    {
        writeln("Running!");
    }
}

class SwimBehavior : IBehavior
{
    void execute()
    {
        writeln("Swimming!");
    }
}

// Character class that uses behaviors
class Character
{
    private IBehavior behavior;

    this(IBehavior initialBehavior)
    {
        behavior = initialBehavior;
    }

    void setBehavior(IBehavior newBehavior)
    {
        behavior = newBehavior;
    }

    void performBehavior()
    {
        behavior.execute();
    }
}
