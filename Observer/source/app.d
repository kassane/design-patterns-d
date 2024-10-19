/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
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

/*
Output:

Observer 1 received update: New State 1
Observer 2 received update: New State 1
Observer 3 received update: New State 1
Observer 1 received update: New State 2
Observer 3 received update: New State 2
*/
