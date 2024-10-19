import memento;

void main()
{
	auto originator = new Originator();
	auto caretaker = new Caretaker();

	originator.setState("State 1");
	caretaker.addMemento(originator.createMemento());

	originator.setState("State 2");
	caretaker.addMemento(originator.createMemento());

	originator.setState("State 3");

	writeln("Current state: ", originator.getState());

	originator.restoreFromMemento(caretaker.getMemento(1));
	writeln("First restored state: ", originator.getState());

	originator.restoreFromMemento(caretaker.getMemento(0));
	writeln("Second restored state: ", originator.getState());
}

/*
Output:

Originator: Setting state to State 1
Originator: Creating memento
Originator: Setting state to State 2
Originator: Creating memento
Originator: Setting state to State 3
Current state: State 3
Originator: State restored to State 2
First restored state: State 2
Originator: State restored to State 1
Second restored state: State 1
*/
