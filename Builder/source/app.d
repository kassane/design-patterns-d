/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import builder;

void main() @safe
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
