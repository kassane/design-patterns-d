/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import composite;
import std.stdio: writeln;

void main() @safe
{
	writeln("Client: I've got a simple component:");
	auto leaf = new Leaf();
	writeln("RESULT: ", leaf);

	writeln("\nClient: Now I've got a composite tree:");
	auto tree = new Branch(
		new Branch(new Leaf(), new Leaf()),
		new Branch(new Leaf())
	);
	writeln("RESULT: ", tree);

	writeln("\nClient: I don't need to check the components classes even when managing the tree:");
	tree.add(new Leaf());
	writeln("RESULT: ", tree);
}

/*
Output:

Client: I've got a simple component:
RESULT: Leaf

Client: Now I've got a composite tree:
RESULT: Branch(Branch(Leaf+Leaf)+Branch(Leaf))

Client: I don't need to check the components classes even when managing the tree:
RESULT: Branch(Branch(Leaf+Leaf)+Branch(Leaf)+Leaf)
*/
