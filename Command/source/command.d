/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module command;
import std.stdio: writefln, writeln;

@safe:

interface Command
{
    void execute();
}

class SimpleCommand : Command
{
    private string message;

    this(string msg)
    {
        message = msg;
    }

    void execute()
    {
        writeln("SimpleCommand: ", message);
    }
}

class Receiver
{
    void doSomething(string a)
    {
        writefln("Receiver: Working on (%s)", a);
    }

    void doSomethingElse(string b)
    {
        writefln("Receiver: Also working on (%s)", b);
    }
}

class ComplexCommand : Command
{
    private Receiver receiver;
    private string a, b;

    this(Receiver rcv, string argA, string argB)
    {
        receiver = rcv;
        a = argA;
        b = argB;
    }

    void execute()
    {
        writeln("ComplexCommand: Complex stuff should be done by a receiver object.");
        receiver.doSomething(a);
        receiver.doSomethingElse(b);
    }
}

class Invoker
{
    private Command onStart;
    private Command onFinish;

    void setOnStart(Command command)
    {
        onStart = command;
    }

    void setOnFinish(Command command)
    {
        onFinish = command;
    }

    void doSomethingImportant()
    {
        writeln("Invoker: Does anybody want something done before I begin?");
        if (onStart)
            onStart.execute();

        writeln("Invoker: ...doing something really important...");

        writeln("Invoker: Does anybody want something done after I finish?");
        if (onFinish)
            onFinish.execute();
    }
}
