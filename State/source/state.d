/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module state;
import std.stdio: writeln;
import std.typecons: Nullable;

@safe:

// State interface
interface State
{
    void handle(Context context);
}

// Concrete states
class ConcreteStateA : State
{
    void handle(Context context)
    {
        writeln("ConcreteStateA handles request1.");
        writeln("ConcreteStateA wants to change the state of the context.");
        context.setState(new ConcreteStateB());
    }
}

class ConcreteStateB : State
{
    void handle(Context context)
    {
        writeln("ConcreteStateB handles request2.");
        writeln("ConcreteStateB wants to change the state of the context.");
        context.setState(new ConcreteStateA());
    }
}

class Context
{
private:
    Nullable!State currentState;

public:
    this()
    {
        setState(new ConcreteStateA());
    }

    void setState(State newState)
    {
        writeln("Context: Transition to ", typeid(newState).name);
        currentState = Nullable!State(newState);
    }

    void request()
    {
        if (!currentState.isNull)
        {
            currentState.get.handle(this);
        }
    }
}
