#include <stdio.h>
#include "./uptime.h"

long get_uptime(void)
{
    FILE           *in = fopen("/proc/uptime", "r");
    long            uptim = 0, a, b;
    if (in) {
        if (2 == fscanf(in, "%ld.%ld", &a, &b))
            uptim = a * 100 + b;
        fclose(in);
    }
    return uptim;
}

