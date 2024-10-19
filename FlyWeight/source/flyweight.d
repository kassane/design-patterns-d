/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/

module flyweight;
import std.stdio;
import std.container.array;
import std.algorithm.iteration;
import std.range;
import std.string;

@safe:

// Flyweight interface
interface Car
{
    void display(string licensePlate, string owner);
}

// Concrete Flyweight
class CarModel : Car
{
    private string brand;
    private string model;
    private string color;

    this(string brand, string model, string color)
    {
        this.brand = brand;
        this.model = model;
        this.color = color;
    }

    void display(string licensePlate, string owner)
    {
        writefln("Flyweight: Displaying shared ([ %s , %s , %s ]) and unique ([ %s , %s ]) state.", brand, model, color, licensePlate, owner);
    }
}

// Flyweight Factory
class CarFactory
{
    private Car[string] flyweights;

    this()
    {
        flyweights["BMW_X6_white"] = new CarModel("BMW", "X6", "white");
        flyweights["Mercedes Benz_C500_red"] = new CarModel("Mercedes Benz", "C500", "red");
        flyweights["Mercedes Benz_C300_black"] = new CarModel("Mercedes Benz", "C300", "black");
        flyweights["BMW_M5_red"] = new CarModel("BMW", "M5", "red");
        flyweights["Chevrolet_Camaro2018_pink"] = new CarModel("Chevrolet", "Camaro2018", "pink");
    }

    Car getCar(string brand, string model, string color)
    {
        string key = format("%s_%s_%s", brand, model, color);
        if (key !in flyweights)
        {
            writefln("FlyweightFactory: Can't find a flyweight, creating new one.");
            flyweights[key] = new CarModel(brand, model, color);
        }
        else
        {
            writefln("FlyweightFactory: Reusing existing flyweight.");
        }
        return flyweights[key];
    }

    void listFlyweights()
    {
        int count = cast(int)flyweights.length;
        writefln("FlyweightFactory: I have %d flyweights:", count);
        foreach (key; flyweights.keys)
        {
            write(key, " ");
        }
        writeln();
    }
}

void addCarToPoliceDatabase(
    CarFactory factory, string brand, string model,
    string color, string licensePlate, string owner)
{
    writeln("Client: Adding a car to database.");
    Car flyweight = factory.getCar(brand, model, color);
    flyweight.display(licensePlate, owner);
}
