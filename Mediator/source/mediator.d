/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module mediator;
import std.stdio;

@safe:

// Mediator interface
interface IMediator
{
    void notify(Component sender, string event);
}

// Base Component class
abstract class Component
{
    protected IMediator mediator;

    this(IMediator mediator)
    {
        this.mediator = mediator;
    }

    void send(string event)
    {
        mediator.notify(this, event);
    }

    abstract void receive(string event);
}

// Concrete Components
class ComponentA : Component
{
    this(IMediator mediator)
    {
        super(mediator);
    }

    override void receive(string event)
    {
        writeln("ComponentA received: ", event);
    }
}

class ComponentB : Component
{
    this(IMediator mediator)
    {
        super(mediator);
    }

    override void receive(string event)
    {
        writeln("ComponentB received: ", event);
    }
}

class ConcreteMediator : IMediator
{
    private Component[string] components;

    void addComponent(string name, Component component)
    {
        components[name] = component;
    }

    override void notify(Component sender, string event)
    {
        foreach (name, component; components)
        {
            if (component !is sender)
            {
                component.receive(event);
            }
        }
    }
}
