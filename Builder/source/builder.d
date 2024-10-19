module builder;
import std.stdio;
import std.string;

// Product
class Pizza
{
    private string dough;
    private string sauce;
    private string topping;

    void setDough(string dough)
    {
        this.dough = dough;
    }

    void setSauce(string sauce)
    {
        this.sauce = sauce;
    }

    void setTopping(string topping)
    {
        this.topping = topping;
    }

    override string toString() const
    {
        return format("Pizza with %s dough, %s sauce, and %s topping", dough, sauce, topping);
    }
}

// Builder interface
interface PizzaBuilder
{
    PizzaBuilder buildDough();
    PizzaBuilder buildSauce();
    PizzaBuilder buildTopping();
    Pizza getResult();
}

// Concrete Builder
class HawaiianPizzaBuilder : PizzaBuilder
{
    private Pizza pizza;

    this()
    {
        pizza = new Pizza();
    }

    PizzaBuilder buildDough()
    {
        pizza.setDough("cross");
        return this;
    }

    PizzaBuilder buildSauce()
    {
        pizza.setSauce("mild");
        return this;
    }

    PizzaBuilder buildTopping()
    {
        pizza.setTopping("ham+pineapple");
        return this;
    }

    Pizza getResult()
    {
        return pizza;
    }
}

// Director
class Waiter
{
    private PizzaBuilder pizzaBuilder;

    void setPizzaBuilder(PizzaBuilder pb)
    {
        pizzaBuilder = pb;
    }

    Pizza getPizza()
    {
        return pizzaBuilder.getResult();
    }

    void constructPizza()
    {
        pizzaBuilder.buildDough()
            .buildSauce()
            .buildTopping();
    }
}
