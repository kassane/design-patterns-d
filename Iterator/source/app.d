/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import iterator;

void main() @safe
{
	// Iterator with int
	auto intAggregate = new ConcreteAggregate!int([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
	auto intIterator = intAggregate.iterator();
	printIterator(intIterator, "Iterator with int");

	// Iterator with custom Class
	auto customAggregate = new ConcreteAggregate!CustomClass([
		new CustomClass(100),
		new CustomClass(1000),
		new CustomClass(10000)
	]);
	auto customIterator = customAggregate.iterator();
	printIterator(customIterator, "Iterator with custom Class");
}

/*
Output:
________________Iterator with int______________________________________
0
1
2
3
4
5
6
7
8
9

________________Iterator with custom Class______________________________________
100
1000
10000
*/
