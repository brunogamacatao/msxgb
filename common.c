#include "common.h"

// TODO change it to update the ticks counter every vblank
static u32 _tick_counter = 0;

u32 get_ticks() {
  return _tick_counter++;
}

void delay(u32 ms) {
  // TODO - implement it 
}


