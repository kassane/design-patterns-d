module iterator;
import std.stdio;
import std.range;

interface Iterator(T)
{
    bool hasNext();
    T next();
}

interface Aggregate(T)
{
    Iterator!T iterator();
}

class ConcreteIterator(T) : Iterator!T
{
    private T[] collection;
    private size_t currentIndex;

    this(T[] collection)
    {
        this.collection = collection;
        this.currentIndex = 0;
    }

    bool hasNext()
    {
        return currentIndex < collection.length;
    }

    T next()
    {
        if (hasNext())
        {
            return collection[currentIndex++];
        }
        throw new Exception("No more elements");
    }
}

class ConcreteAggregate(T) : Aggregate!T
{
    private T[] items;

    this(T[] items)
    {
        this.items = items;
    }

    Iterator!T iterator()
    {
        return new ConcreteIterator!T(items);
    }
}

class CustomClass
{
    int value;

    this(int value)
    {
        this.value = value;
    }

    override string toString()
    {
        import std.conv: to;

        return value.to!string;
    }
}

void printIterator(T)(Iterator!T iterator, string title)
{
    writeln("________________", title, "______________________________________");
    while (iterator.hasNext())
    {

        iterator.next.write("\n");
    }
    writeln();
}
