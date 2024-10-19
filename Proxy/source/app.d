import proxy;

void main()
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
