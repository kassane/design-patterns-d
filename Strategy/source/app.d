/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import strategy;
import std.stdio;

void main() @safe
{
	int[] data = [5, 2, 8, 1, 9];

	auto bubbleStrategy = new BubbleSort!int();
	auto quickStrategy = new QuickSort!int();

	auto sorter = new Sorter!int(bubbleStrategy);

	writeln("Original data: ", data);
	writeln("Sorted with Bubble Sort: ", sorter.executeSort(data));

	sorter.setStrategy(quickStrategy);
	writeln("Sorted with Quick Sort: ", sorter.executeSort(data));
}

/*
Output:

Original data: [5, 2, 8, 1, 9]
Sorted with Bubble Sort: [1, 2, 5, 8, 9]
Sorted with Quick Sort: [1, 2, 5, 8, 9]
*/
