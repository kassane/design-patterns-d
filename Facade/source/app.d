import facade;

void main()
{
	auto computer = new ComputerFacade();
	computer.start();

	// Using UFCS to call diagnostics
	computer.diagnostics.each!writeln;

	// Using generated operations
	computer.shutdown();
	computer.reboot();
	computer.suspend();
}

/*
Output:

CPU: Freezing...
Memory: Loading data 'Data from sector 0 with size 1024' at position 0
CPU: Jumping to position 0
CPU: Executing...
Diagnostic: CPU Status: OK
Diagnostic: Memory Status: OK
Diagnostic: Hard Drive Status: OK
Computer: Shutdown...
Computer: Reboot...
Computer: Suspend...
*/
