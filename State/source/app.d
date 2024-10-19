/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import state;

void main()
{
	auto context = new Context();

	// Demonstrate state transitions
	foreach (i; 0 .. 3)
	{
		context.request();
	}
}

/*
Output:

Context: Transition to app.State
ConcreteStateA handles request1.
ConcreteStateA wants to change the state of the context.
Context: Transition to app.State
ConcreteStateB handles request2.
ConcreteStateB wants to change the state of the context.
Context: Transition to app.State
ConcreteStateA handles request1.
ConcreteStateA wants to change the state of the context.
Context: Transition to app.State
*/
