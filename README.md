#  GBMSX — Game Boy Emulator for MSX2+

```
 ██████╗ ██████╗ ███╗   ███╗███████╗██╗  ██╗
██╔════╝ ██╔══██╗████╗ ████║██╔════╝╚██╗██╔╝
██║  ███╗██████╔╝██╔████╔██║███████╗ ╚███╔╝
██║   ██║██╔══██╗██║╚██╔╝██║╚════██║ ██╔██╗
╚██████╔╝██████╔╝██║ ╚═╝ ██║███████║██╔╝ ██╗
 ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
```

An attempt to bring the **Game Boy Classic** experience to the **MSX2+** platform,
written in C using the [MSXgl](https://github.com/aoineko-fr/MSXgl) library and targeting MSX-DOS 2.

> Based on the excellent tutorial series by rockytriton:
> [https://github.com/rockytriton/LLD_gbemu](https://github.com/rockytriton/LLD_gbemu)

**Author:** Bruno Catao
**Target:** MSX2+ / MSX-DOS 2
**License:** CC BY-SA

---

## Features

- Game Boy Classic CPU (Sharp LR35902) emulation
- Memory bus with full address space mapping
- PPU (Picture Processing Unit) with OAM and VRAM
- LCD controller with palette support
- Timer, DMA, and interrupt handling
- MSX-DOS 2 file loading — runs `.gb` ROM files directly from disk

---

## Requirements

### Hardware / Emulator

- MSX2+ computer (or emulator) with at least **1 MB RAM**
- MSX-DOS 2 (`MSXDOS2.SYS` + `COMMAND2.COM`)
- A Game Boy Classic ROM file (`.gb`)

> Tested on [openMSX](https://openmsx.org/) with the Panasonic FS-A1WSX profile
> and `-ext ram1mb` to ensure enough memory is available.

### Build Dependencies

| Tool | Purpose | Download |
|------|---------|----------|
| [MSXgl](https://github.com/aoineko-fr/MSXgl) | MSX game library & build toolchain | GitHub |
| [SDCC](https://sdcc.sourceforge.net/) | Small Device C Compiler (Z80 target) | SourceForge |
| [Node.js](https://nodejs.org/) | Required by the MSXgl build tool | nodejs.org |

Make sure MSXgl is installed and its path is correctly set in your environment before building.
The expected path in the build scripts is `~/dev/MSXgl` — adjust `build.sh` / `build.bat` if yours differs.

---

## Project Structure

```
gbmsx/
├── src/                  # C source files
│   ├── gbmsx.c           # Entry point
│   ├── emu.c             # Emulator loop
│   ├── cpu.c             # GB CPU (LR35902)
│   ├── instructions.c    # CPU instruction set
│   ├── bus.c             # Memory bus
│   ├── cart.c            # Cartridge / ROM loader
│   ├── ram.c             # WRAM and HRAM
│   ├── ppu.c             # Picture Processing Unit
│   ├── ppu_sm.c          # PPU state machine
│   ├── lcd.c             # LCD controller
│   ├── dma.c             # DMA transfer
│   ├── io.c              # I/O registers
│   ├── interrupts.c      # Interrupt handling
│   ├── stack.c           # Stack helpers
│   ├── timer.c           # Timer controller
│   ├── dbg.c             # Debug serial output
│   ├── common.c          # Shared utilities
│   └── msx_printf.c      # MSX printf wrapper
├── include/              # Header files
├── out/                  # Build output (generated)
├── emul/                 # Emulator disk image and ROM files
│   └── dos2/
│       ├── gbmsx.com     # Compiled binary
│       ├── tetris.gb     # Test ROM (not included)
│       └── zelda.gb      # Test ROM (not included)
├── msxgl_config.h        # MSXgl library configuration
├── project_config.js     # MSXgl build configuration
├── build.sh              # Linux / macOS build script
└── build.bat             # Windows build script
```

---

## Building

### Linux / macOS

```bash
./build.sh
```

### Windows

```bat
build.bat
```

The build script compiles all sources, links them with the MSXgl library, and produces
`out/gbmsx.com` — a standard MSX-DOS 2 executable. It also copies the binary to
`emul/dos2/gbmsx.com` and can optionally launch openMSX automatically.

---

## Running

Copy `gbmsx.com` and your `.gb` ROM file to a disk that boots MSX-DOS 2, then run:

```
A:\> gbmsx <rom_file>
```

**Example:**

```
A:\> gbmsx tetris.gb
```

If you use openMSX, the `build.sh` / `build.bat` scripts can launch it automatically
with the pre-configured disk image in `emul/dsk/DOS2_gbmsx.dsk`.

---

## Status

> This is a work in progress. The following components are implemented but the emulator
> is not yet fully functional for most games.

| Component | Status |
|-----------|--------|
| CPU (LR35902) | 🟡 In progress |
| Instruction set | 🟡 In progress |
| Memory bus | ✅ Done |
| Cartridge loader (ROM only) | ✅ Done |
| WRAM / HRAM | ✅ Done |
| PPU / LCD | 🟡 In progress |
| Timer | 🟡 In progress |
| Interrupts | 🟡 In progress |
| DMA | 🟡 In progress |
| MBC1/MBC3/MBC5 | ❌ Not yet |
| Sound | ❌ Not yet |

---

## References

- [rockytriton/LLD_gbemu](https://github.com/rockytriton/LLD_gbemu) — tutorial this project is based on
- [MSXgl](https://github.com/aoineko-fr/MSXgl) — MSX game library used for I/O, memory and DOS access
- [Pan Docs](https://gbdev.io/pandocs/) — comprehensive Game Boy hardware documentation
- [MSX-DOS 2 Function Specification](https://map.grauw.nl/resources/dos2_functioncalls.php) — DOS2 BDOS reference
