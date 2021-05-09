#include "kernel.h"
#include "util.h"
#include "../drivers/ports.h"
#include "../drivers/screen.h"


void kernel_main()
{
    clear_screen();

    kprint("The operating system has started welcome to ArinOS");

    for (int i = 1; i <= 1000; i++)
    {
        kprint(itoa(print_fibonacci_kernel(i)));
    }
}


int print_fibonacci_kernel(int num)
{
    if (num <= 1)
    {
        return num;
    }
    else
    {
        return(print_fibonacci_kernel(num-1) + print_fibonacci_kernel(num-2));
    }
}