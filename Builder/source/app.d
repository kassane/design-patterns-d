import builder;

void main()
{
	// Using UFCS and method chaining
	auto house = new House.Builder()
		.setFoundation("Concrete")
		.setStructure("Brick")
		.setRoof("Tile")
		.build();

	writeln(house);

	// Using with statement for compact initialization
	with (new House.Builder())
	{
		setFoundation("Stone")
			.setStructure("Wood")
			.setRoof("Shingle")
			.setInterior("Modern")
			.build()
			.writeln();
	}
}

/*
Output:

House(foundation: Concrete, structure: Brick, roof: Tile, interior: Not set)
House(foundation: Stone, structure: Wood, roof: Shingle, interior: Modern)
*/
