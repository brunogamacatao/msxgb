#pragma once

#include "dos.h"
#include "memory.h"
#include "msx_printf.h"

#define MSX_BIT(a, n) ((a & (1 << n)) ? 1 : 0)

#define MSX_BIT_SET(a, n, on) \
  do { \
    if (on) (a) |= (1 << (n)); \
    else (a) &= ~(1 << (n)); \
  } while (0)

#define MSX_BETWEEN(a, b, c) ((a >= b) && (a <= c))

u32 get_ticks();
void delay(u32 ms); 

#define exit(n) DOS_Exit(n)
#define NO_IMPL { printf("NOT YET IMPLEMENTED\n"); exit(0); }

#define memset(buf, val, sz) Mem_Set(val, buf, sz)
