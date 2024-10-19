module builder;
public import std.stdio;
import std.typecons: Nullable;

class House
{
    private string foundation;
    private string structure;
    private string roof;
    private Nullable!string interior;

    static class Builder
    {
        private House house;

        this()
        {
            house = new House();
        }

        auto setFoundation(string foundation)
        {
            house.foundation = foundation;
            return this;
        }

        auto setStructure(string structure)
        {
            house.structure = structure;
            return this;
        }

        auto setRoof(string roof)
        {
            house.roof = roof;
            return this;
        }

        // Optional parameter using Nullable
        auto setInterior(string interior)
        {
            house.interior = interior;
            return this;
        }

        // Using UFCS (Uniform Function Call Syntax)
        House build()
        {
            return house;
        }
    }

    // toString using string interpolation
    override string toString() const
    {
        import std.format: format;

        return format!"House(foundation: %s, structure: %s, roof: %s, interior: %s)"(
            foundation, structure, roof, interior.isNull ? "Not set" : interior.get
        );
    }
}
