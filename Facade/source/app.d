/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
import facade;

void main() @safe
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
