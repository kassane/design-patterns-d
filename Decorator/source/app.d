/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import decorator;
import std.stdio: writeln;

void main() @safe
{
	auto text = new PlainText("Hello, Decorator Pattern in D!");

	// Using UFCS
	writeln(text.bold.italic.underline.getContent);

	// Using nested calls
	writeln(new UnderlineDecorator(new ItalicDecorator(new BoldDecorator(text))).getContent());
}

/*
Output:

<u><i><b>Hello, Decorator Pattern in D!</b></i></u>
<u><i><b>Hello, Decorator Pattern in D!</b></i></u>
*/
