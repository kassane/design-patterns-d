import builder;

void main()
{
	auto waiter = new Waiter();
	auto hawaiianPizzaBuilder = new HawaiianPizzaBuilder();

	waiter.setPizzaBuilder(hawaiianPizzaBuilder);
	waiter.constructPizza();

	Pizza pizza = waiter.getPizza();
	writeln(pizza.toString());
}
