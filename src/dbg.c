#include "bus.h"
#include "dbg.h"

static char *dbg_msg;
static int msg_size = 0;

void dbg_init() {
  printf("Initializing debug...\r\n");
  dbg_msg = Mem_HeapAlloc(1024);

  if (!dbg_msg) {
    printf("Could not allocate bgc_msg\r\n");
    exit(-1);
  }
  printf("Done debug initialization\r\n");
}

void dbg_update() {
  if (bus_read(0xFF02) == 0x81) {
    char c = bus_read(0xFF01);

    dbg_msg[msg_size++] = c;

    bus_write(0xFF02, 0);
  }
}

void dbg_print() {
  if (dbg_msg[0]) {
    printf("DBG: %s\n", dbg_msg);
  }
}
