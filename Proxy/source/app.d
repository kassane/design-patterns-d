/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import proxy;

void main() @safe
{
	auto proxy = new Proxy();

	proxy.request();
}

/*
Output:

Proxy: Logging request before delegation.
RealSubject: Handling request.
Proxy: Logging request after delegation.
*/
