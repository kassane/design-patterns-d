/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module observer;
import std.stdio: writefln;
import std.container: DList;
import std.algorithm: remove;

@safe:

interface Observer
{
    void update(string message);
}

class Subject
{
private:
    DList!Observer observers;
    string state;

public:
    void attach(Observer observer) @trusted
    {
        observers.insertBack(observer);
    }

    void detach(Observer observer) @trusted
    {
        observers = DList!Observer(observers[].remove!(a => a == observer));
    }

    void setState(string newState)
    {
        state = newState;
        notifyObservers();
    }

    void notifyObservers()
    {
        foreach (observer; observers)
        {
            observer.update(state);
        }
    }
}

class ConcreteObserver : Observer
{
private:
    string name;

public:
    this(string observerName)
    {
        name = observerName;
    }

    void update(string message)
    {
        writefln("%s received update: %s", name, message);
    }
}
