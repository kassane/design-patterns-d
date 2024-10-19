/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import behavior;

void main() @safe
{
	auto jumpBehavior = new JumpBehavior();
	auto runBehavior = new RunBehavior();
	auto swimBehavior = new SwimBehavior();

	auto character = new Character(jumpBehavior);

	writeln("Character performs different behaviors:");
	character.performBehavior();

	character.setBehavior(runBehavior);
	character.performBehavior();

	character.setBehavior(swimBehavior);
	character.performBehavior();

	// Using std.algorithm and std.range for behavior selection
	IBehavior[] behaviors = [
		cast(IBehavior)jumpBehavior, cast(IBehavior)runBehavior,
		cast(IBehavior)swimBehavior
	];
	writeln("\nRandom behavior selection:");
	behaviors.randomShuffle().take(3).each!((b) {
		character.setBehavior(b);
		character.performBehavior();
	});
}

/*
Output:

Character performs different behaviors:
Jumping!
Running!
Swimming!

Random behavior selection:
Running!
Swimming!
Jumping!
*/
