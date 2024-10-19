/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/

import singleton;
import std.stdio: writeln;

void main() @safe
{
	// Get the Singleton instance twice
	Singleton singleton1 = Singleton.getInstance();
	Singleton singleton2 = Singleton.getInstance();

	// Error: constructor `singleton.Singleton.this` is not accessible from module `app`
	// Singleton singleton3 = new Singleton();
	// _ = singleton3;

	// Output the values
	writeln("If you see the same value, then singleton was reused (yay!");
	writeln("If you see different values, then 2 singletons were created (booo!!)");
	writeln("RESULT: ", singleton1.getValue(), " ", singleton2.getValue());
}

/*
Output:

If you see the same value, then singleton was reused (yay!
If you see different values, then 2 singletons were created (booo!!)
RESULT: FOO FOO
*/
