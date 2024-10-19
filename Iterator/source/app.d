import iterator;

void main()
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
