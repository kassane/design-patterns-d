/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/

module flyweight;
import std.stdio: writeln, writefln;
import std.format: format;

@safe:

interface Car
{
    void display(string licensePlate, string owner) const;
}

class CarModel : Car
{
    private SharedState sharedState;

    this(ref const SharedState sharedState)
    {
        this.sharedState = sharedState;
    }

    void display(string licensePlate, string owner) const
    {
        writefln("Flyweight: Displaying shared ([ %s , %s , %s ]) and unique ([ %s , %s ]) state.",
            sharedState.brand, sharedState.model, sharedState.color, licensePlate, owner);
    }
}

struct SharedState
{
    string brand;
    string model;
    string color;
}

// Flyweight Factory
class CarFactory
{
    private Car[string] flyweights;

    this()
    {
        addFlyweight("BMW", "X6", "white");
        addFlyweight("Mercedes Benz", "C500", "red");
        addFlyweight("Mercedes Benz", "C300", "black");
        addFlyweight("BMW", "M5", "red");
        addFlyweight("Chevrolet", "Camaro2018", "pink");
    }

    private void addFlyweight(string brand, string model, string color)
    {
        immutable string key = format("%s_%s_%s", brand, model, color);
        flyweights[key] = new CarModel(SharedState(brand, model, color));
    }

    Car getCar(string brand, string model, string color)
    {
        immutable string key = format("%s_%s_%s", brand, model, color);
        if (key !in flyweights)
        {
            writefln("FlyweightFactory: Can't find a flyweight, creating new one.");
            flyweights[key] = new CarModel(SharedState(brand, model, color));
        }
        else
        {
            writefln("FlyweightFactory: Reusing existing flyweight.");
        }
        return flyweights[key];
    }

    void listFlyweights() const
    {
        int count = cast(int)flyweights.length;
        writefln("\nFlyweightFactory: I have %d flyweights:", count);
        foreach (key; flyweights.byKey)
        {
            writeln(key);
        }
    }
}

void addCarToPoliceDatabase(
    CarFactory factory, string brand, string model,
    string color, string licensePlate, string owner)
{
    writeln("\nClient: Adding a car to database.");
    Car flyweight = factory.getCar(brand, model, color);
    flyweight.display(licensePlate, owner);
}
