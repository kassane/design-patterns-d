/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import command;

void main() @safe
{
	auto invoker = new Invoker;
	invoker.setOnStart(new SimpleCommand("Say Hi!"));

	auto receiver = new Receiver;
	invoker.setOnFinish(new ComplexCommand(receiver, "Send email.", "Save report."));

	invoker.doSomethingImportant;
}

/*
Output:

Invoker: Does anybody want something done before I begin?
SimpleCommand: Say Hi!
Invoker: ...doing something really important...
Invoker: Does anybody want something done after I finish?
ComplexCommand: Complex stuff should be done by a receiver object.
Receiver: Working on (Send email.)
Receiver: Also working on (Save report.)
*/
