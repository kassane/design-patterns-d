/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/

import singleton;
import std.stdio: write, writeln;

void taskFunction(string value) @safe
{
	import core.thread: Thread;
	import core.time: dur;

	Thread.sleep(dur!"msecs"(1000));
	auto singleton = Singleton.getInstance(value);
	write(" ", singleton.value);
}

void main() @safe
{
	import std.parallelism: task, TaskPool;
	import std.algorithm: each;

	"If you see the same value, then singleton was reused (yay!)".writeln;
	"If you see different values, then 2 singletons were created (booo!!)".writeln;
	"RESULT:".write;

	// Error: constructor `singleton.Singleton.this` is not accessible from module `app`
	// auto singleton = new Singleton("FOO");
	// _ = singleton;

	auto pool = new TaskPool();
	scope (exit)
		pool.stop();

	auto tasks = [
		task(&taskFunction, "FOO"),
		task(&taskFunction, "BAR")
	];

	tasks.each!(t => pool.put(t));
	pool.finish();

	foreach (t; tasks)
	{
		t.yieldForce();
	}
	writeln();
}

/*
Output:

If you see the same value, then singleton was reused (yay!
If you see different values, then 2 singletons were created (booo!!)
RESULT: FOO BAR
*/
