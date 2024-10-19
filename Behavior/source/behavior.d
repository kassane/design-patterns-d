module behavior;
import std.stdio;
import std.algorithm;
import std.range;
import std.random;

// Define an interface for behaviors
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
