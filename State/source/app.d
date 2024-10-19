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
