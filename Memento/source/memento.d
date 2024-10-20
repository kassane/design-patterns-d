/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module memento;
public import std.stdio;
import std.typecons: Tuple;

@safe:

// Memento: Stores the internal state of the Originator
struct Memento
{
    private string state;

    this(string state)
    {
        this.state = state;
    }

    string getState() const
    {
        return state;
    }
}

// Originator: Creates and uses mementos
class Originator
{
    private string state;

    void setState(string state)
    {
        this.state = state;
        writeln("Originator: Setting state to ", state);
    }

    string getState() const
    {
        return state;
    }

    // D-specific feature: Using tuple as a lightweight alternative to a separate class
    auto createMemento() const
    {
        writeln("Originator: Creating memento");
        return Tuple!(Memento, "memento")(Memento(state));
    }

    void restoreFromMemento(Tuple!(Memento, "memento") tuple)
    {
        state = tuple.memento.getState();
        writeln("Originator: State restored to ", state);
    }
}

// Caretaker: Manages and safekeeps mementos
class Caretaker
{
    private Tuple!(Memento, "memento")[] mementos;

    void addMemento(Tuple!(Memento, "memento") m)
    {
        mementos ~= m;
    }

    // D-specific feature: Using array slicing for efficient element access
    Tuple!(Memento, "memento") getMemento(size_t index)
    {
        return mementos[index];
    }
}
