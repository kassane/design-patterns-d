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
