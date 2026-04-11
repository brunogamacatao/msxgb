#pragma once

#include "dos.h"

typedef struct {
  bool paused;
  bool running;
  u64 ticks;
} emu_context;

u8 emu_run(u8 argc, const c8 **argv);
emu_context *emu_get_context();
void emu_cycles(int cpu_cycles);
