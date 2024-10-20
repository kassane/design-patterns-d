/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import chains;

void main() @safe
{
	// Create handlers
	auto monkey = new AnimalHandler("Monkey", ["Banana"]);
	auto squirrel = new AnimalHandler("Squirrel", ["Nut"]);
	auto dog = new AnimalHandler("Dog", ["Bone"]);

	// Create and use the main chain
	auto mainChain = new Chain(monkey, squirrel, dog);
	writeln(mainChain);

	void clientCode(Chain chain, string[] requests)
	{
		foreach (request; requests)
		{
			writefln("Client: Who wants a %s?", request);
			chain.handle(request);
		}
	}

	string[] requests = ["Nut", "Banana", "Cup of coffee"];
	clientCode(mainChain, requests);

	// Create and use a subchain
	writeln("\nSubchain: Squirrel > Dog");
	auto subChain = new Chain(squirrel, dog);
	clientCode(subChain, requests);
}

/*
Output:

Chain: > Monkey > Squirrel > Dog
Client: Who wants a Nut?
  Squirrel: I'll eat the Nut.
Client: Who wants a Banana?
  Monkey: I'll eat the Banana.
Client: Who wants a Cup of coffee?
  Cup of coffee was left untouched.

Subchain: Squirrel > Dog
Client: Who wants a Nut?
  Squirrel: I'll eat the Nut.
Client: Who wants a Banana?
  Banana was left untouched.
Client: Who wants a Cup of coffee?
  Cup of coffee was left untouched.
*/
