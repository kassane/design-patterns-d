/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module factory;
import std.stdio;
import std.traits;
import std.sumtype;

@safe:

// Product interface
interface Product
{
    void use();
}

// Concrete products
class ConcreteProductA : Product
{
    void use()
    {
        writeln("Using ConcreteProductA");
    }
}

class ConcreteProductB : Product
{
    void use()
    {
        writeln("Using ConcreteProductB");
    }
}

// Factory using D's template features
class Factory(T...)
{
    static Product create(string productType)
    {
        foreach (ProductType; T)
        {
            if (productType == ProductType.stringof)
            {
                return new ProductType();
            }
        }
        throw new Exception("Invalid product type");
    }
}

// SumType-based factory
class VariantFactory
{
    alias ProductVariant = SumType!(ConcreteProductA, ConcreteProductB);

    static Product create(string productType) @trusted
    {
        ProductVariant product;

        switch (productType)
        {
        case "ConcreteProductA":
            product = ProductVariant(new ConcreteProductA());
            break;
        case "ConcreteProductB":
            product = ProductVariant(new ConcreteProductB());
            break;
        default:
            throw new Exception("Invalid product type");
        }

        return product.match!(
            (ConcreteProductA a) => cast(Product)a,
            (ConcreteProductB b) => cast(Product)b
        );
    }
}
