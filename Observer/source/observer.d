module observer;
import std.stdio: writefln;
import std.container: DList;
import std.algorithm: remove;

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
    void attach(Observer observer)
    {
        observers.insertBack(observer);
    }

    void detach(Observer observer)
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
