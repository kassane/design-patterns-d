module factory;
import std.stdio;
import std.traits;
import std.variant;

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

// Variant-based factory
class VariantFactory
{
    alias ProductVariant = Algebraic!(ConcreteProductA, ConcreteProductB);

    static Product create(string productType)
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

        return product.visit!(
            (ConcreteProductA a) => cast(Product)a,
            (ConcreteProductB b) => cast(Product)b
        );
    }
}
