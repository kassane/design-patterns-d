import observer;

void main()
{
	auto subject = new Subject();

	auto observer1 = new ConcreteObserver("Observer 1");
	auto observer2 = new ConcreteObserver("Observer 2");
	auto observer3 = new ConcreteObserver("Observer 3");

	subject.attach(observer1);
	subject.attach(observer2);
	subject.attach(observer3);

	subject.setState("New State 1");

	subject.detach(observer2);

	subject.setState("New State 2");
}
