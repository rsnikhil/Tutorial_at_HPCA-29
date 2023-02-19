#include <stdio.h>

#ifdef CONSOLE_UART
#include "ns16550.h"
#endif

int main (int argc, char *argv[])
{
    int ch;

    while (1) {

#ifdef CONSOLE_UART
	// This directly uses a UART instead of fgetc()
	// which requires setup of interrupt-handling
	ch = ns16550_rxchar();
#else
	ch = fgetc (stdin);
#endif

	if ((ch == EOF) || (ch == 4))
	    break;
	fputc (ch, stdout);
    }
    return 0;
}
