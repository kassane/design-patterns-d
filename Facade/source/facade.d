/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module facade;

public
{
    import std.stdio;
    import std.algorithm;
}
import std.range;
import std.string;

@safe:

// Subsystem classes
class CPU
{
    void freeze()
    {
        writeln("CPU: Freezing...");
    }

    void jump(long position)
    {
        writeln("CPU: Jumping to position ", position);
    }

    void execute()
    {
        writeln("CPU: Executing...");
    }
}

class Memory
{
    void load(long position, string data)
    {
        writeln("Memory: Loading data '", data, "' at position ", position);
    }
}

class HardDrive
{
    string read(long lba, int size)
    {
        import std.conv;

        return "Data from sector " ~ lba.to!string ~ " with size " ~ size.to!string;
    }
}

// Facade
class ComputerFacade
{
    private CPU cpu;
    private Memory memory;
    private HardDrive hardDrive;

    this()
    {
        cpu = new CPU();
        memory = new Memory();
        hardDrive = new HardDrive();
    }

    void start()
    {
        cpu.freeze();
        memory.load(0, hardDrive.read(0, 1024));
        cpu.jump(0);
        cpu.execute();
    }

    // Using D's UFCS (Uniform Function Call Syntax)
    auto diagnostics()
    {
        return [
            "CPU Status: OK",
            "Memory Status: OK",
            "Hard Drive Status: OK"
        ].map!(s => "Diagnostic: " ~ s);
    }

    // Using D's string mixins for compile-time code generation
    mixin(generateOperations(["shutdown", "reboot", "suspend"]));
}

// Compile-time function to generate operations
string generateOperations(string[] operations)
{
    import std.array: join;

    return operations.map!(
        op =>
            "void " ~ op ~ "() { writeln(\"Computer: " ~ op.capitalize() ~ "...\"); }"
    ).join("\n");
}
