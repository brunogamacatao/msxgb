#include "ppu.h"
#include "lcd.h"
#include "memory.h"
#include "ppu_sm.h"

static ppu_context *ctx;

ppu_context *ppu_get_context() { return ctx; }

void ppu_init() {
  printf("Initializing ppu...\r\n");
  ctx = Mem_HeapAlloc(sizeof(ppu_context));

  if (!ctx) {
    printf("Could not allocate ppu context\r\n");
    exit(-1);
  }

  ctx->current_frame = 0;
  ctx->line_ticks = 0;

  lcd_init();
  LCDS_MODE_SET(MODE_OAM);

  memset(ctx->oam_ram, 0, sizeof(ctx->oam_ram));
  printf("Done ppu initialization\r\n");
}

void ppu_tick() {
  ctx->line_ticks++;

  switch (LCDS_MODE) {
  case MODE_OAM:
    ppu_mode_oam();
    break;
  case MODE_XFER:
    ppu_mode_xfer();
    break;
  case MODE_VBLANK:
    ppu_mode_vblank();
    break;
  case MODE_HBLANK:
    ppu_mode_hblank();
    break;
  }
}

void ppu_oam_write(u16 address, u8 value) {
  if (address >= 0xFE00) {
    address -= 0xFE00;
  }

  u8 *p = (u8 *)ctx->oam_ram;
  p[address] = value;
}

u8 ppu_oam_read(u16 address) {
  if (address >= 0xFE00) {
    address -= 0xFE00;
  }

  u8 *p = (u8 *)ctx->oam_ram;
  return p[address];
}

void ppu_vram_write(u16 address, u8 value) {
  ctx->vram[address - 0x8000] = value;
}

u8 ppu_vram_read(u16 address) { return ctx->vram[address - 0x8000]; }
