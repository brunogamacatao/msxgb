#include "emu.h"
#include "cart.h"
#include "msx_printf.h"
#include "font/font_mgl_sample6.h"

#define MSX_GL "\x01\x02\x03\x04\x05\x06"

const u8 g_ChrAnim[] = { '-', '/', '|', '\\' };

static emu_context ctx;

emu_context *emu_get_context() {
  return &ctx;
}

u8 emu_run(u8 argc, const c8 **argv) {
  msx_printf("argc = %d\r\n", argc);

  if (argc < 1) {
    msx_printf("Usage: gbmsx <rom_file>\r\n");
    return 0;
  }

  if (!cart_load(argv[0])) {
    msx_printf("Failed to load ROM file: %s\r\n", argv[0]);
    return 0;
  }

  msx_printf("Cart loaded\r\n");

/*	VDP_SetMode(VDP_MODE_SCREEN5);
	VDP_SetColor(COLOR_BLACK);
	VDP_EnableVBlank(TRUE);
	VDP_ClearVRAM();

	Print_SetBitmapFont(g_Font_MGL_Sample6);
	Print_SetColor(COLOR_WHITE, COLOR_BLACK);
	Print_SetPosition(0, 0);
	Print_DrawText(MSX_GL" Hello World !");


	u8 count = 0;
	while(!Keyboard_IsKeyPressed(KEY_ESC)) {
		Halt(); // Wait V-Blank
    
    // Draw things
		Print_SetPosition(255-8, 0);
		Print_DrawChar(g_ChrAnim[count++ % 4]);
	}

	Bios_Exit(0);*/

  return 0;
}
