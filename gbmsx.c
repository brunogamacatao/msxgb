//  ██████╗ ██████╗ ███╗   ███╗███████╗██╗  ██╗
// ██╔════╝ ██╔══██╗████╗ ████║██╔════╝╚██╗██╔╝
// ██║  ███╗██████╔╝██╔████╔██║███████╗ ╚███╔╝ 
// ██║   ██║██╔══██╗██║╚██╔╝██║╚════██║ ██╔██╗ 
// ╚██████╔╝██████╔╝██║ ╚═╝ ██║███████║██╔╝ ██╗
//  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
//
// Game Boy Classic Emulator for MSX2+
// ─────────────────────────────────────────────
// An attempt to bring the Game Boy experience
// to the MSX2+ platform, written in C using the
// MSXgl library (https://github.com/aoineko-fr/MSXgl)
//
// Based on the excellent tutorial series by rockytriton:
// https://github.com/rockytriton/LLD_gbemu
//
// Author : Bruno Catao
// Target : MSX2+ / MSX-DOS 2
// License: CC BY-SA
// ─────────────────────────────────────────────
#include "gbmsx.h"

u8 main(u8 argc, const c8** argv) {
  return emu_run(argc, argv);
}
