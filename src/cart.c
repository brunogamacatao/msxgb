// ____________________________
// ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │   ▄▄▄                ▄▄
// ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │  ▀█▄  ▄▀██ ▄█▄█ ██▀▄ ██  ▄███
// █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │  ▄▄█▀ ▀▄██ ██ █ ██▀  ▀█▄ ▀█▄▄
// ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘                 ▀▀
// Cartridge loader — uses DOS2 memory mapper segments for ROM storage
// Each segment is 16KB. ROM banks are read directly via DOSMapper_ReadByte.
//─────────────────────────────────────────────────────────────────────────────

#include "dos.h"
#include "dos_mapper.h"
#include "common.h"
#include "memory.h"
#include "cart.h"
#include "string.h"

// Each mapper segment is 16KB — matches the Game Boy ROM bank size exactly
#define SEG_SIZE      0x4000
#define MAX_SEGMENTS  32     // 32 x 16KB = 512KB max ROM

typedef struct {
  c8          filename[64];
  u32         rom_size;
  u8          num_segments;
  DOS_Segment segments[MAX_SEGMENTS];
  rom_header  header;       // local copy — safe to read any time
} cart_context;

static cart_context ctx;

static const char *ROM_TYPES[] = {
    "ROM ONLY",
    "MBC1",
    "MBC1+RAM",
    "MBC1+RAM+BATTERY",
    "0x04 ???",
    "MBC2",
    "MBC2+BATTERY",
    "0x07 ???",
    "ROM+RAM 1",
    "ROM+RAM+BATTERY 1",
    "0x0A ???",
    "MMM01",
    "MMM01+RAM",
    "MMM01+RAM+BATTERY",
    "0x0E ???",
    "MBC3+TIMER+BATTERY",
    "MBC3+TIMER+RAM+BATTERY 2",
    "MBC3",
    "MBC3+RAM 2",
    "MBC3+RAM+BATTERY 2",
    "0x14 ???",
    "0x15 ???",
    "0x16 ???",
    "0x17 ???",
    "0x18 ???",
    "MBC5",
    "MBC5+RAM",
    "MBC5+RAM+BATTERY",
    "MBC5+RUMBLE",
    "MBC5+RUMBLE+RAM",
    "MBC5+RUMBLE+RAM+BATTERY",
    "0x1F ???",
    "MBC6",
    "0x21 ???",
    "MBC7+SENSOR+RUMBLE+RAM+BATTERY",
};

static const char *LIC_CODE[0xA5] = {
    [0x00] = "None",
    [0x01] = "Nintendo R&D1",
    [0x08] = "Capcom",
    [0x13] = "Electronic Arts",
    [0x18] = "Hudson Soft",
    [0x19] = "b-ai",
    [0x20] = "kss",
    [0x22] = "pow",
    [0x24] = "PCM Complete",
    [0x25] = "san-x",
    [0x28] = "Kemco Japan",
    [0x29] = "seta",
    [0x30] = "Viacom",
    [0x31] = "Nintendo",
    [0x32] = "Bandai",
    [0x33] = "Ocean/Acclaim",
    [0x34] = "Konami",
    [0x35] = "Hector",
    [0x37] = "Taito",
    [0x38] = "Hudson",
    [0x39] = "Banpresto",
    [0x41] = "Ubi Soft",
    [0x42] = "Atlus",
    [0x44] = "Malibu",
    [0x46] = "angel",
    [0x47] = "Bullet-Proof",
    [0x49] = "irem",
    [0x50] = "Absolute",
    [0x51] = "Acclaim",
    [0x52] = "Activision",
    [0x53] = "American sammy",
    [0x54] = "Konami",
    [0x55] = "Hi tech entertainment",
    [0x56] = "LJN",
    [0x57] = "Matchbox",
    [0x58] = "Mattel",
    [0x59] = "Milton Bradley",
    [0x60] = "Titus",
    [0x61] = "Virgin",
    [0x64] = "LucasArts",
    [0x67] = "Ocean",
    [0x69] = "Electronic Arts",
    [0x70] = "Infogrames",
    [0x71] = "Interplay",
    [0x72] = "Broderbund",
    [0x73] = "sculptured",
    [0x75] = "sci",
    [0x78] = "THQ",
    [0x79] = "Accolade",
    [0x80] = "misawa",
    [0x83] = "lozc",
    [0x86] = "Tokuma Shoten Intermedia",
    [0x87] = "Tsukuda Original",
    [0x91] = "Chunsoft",
    [0x92] = "Video system",
    [0x93] = "Ocean/Acclaim",
    [0x95] = "Varie",
    [0x96] = "Yonezawa/s'pal",
    [0x97] = "Kaneko",
    [0x99] = "Pack in soft",
    [0xA4] = "Konami (Yu-Gi-Oh!)"
};

const char *cart_lic_name() {
    if (ctx.header.new_lic_code <= 0xA4) {
        return LIC_CODE[ctx.header.lic_code];
    }
    return "UNKNOWN";
}

const char *cart_type_name() {
    if (ctx.header.type <= 0x22) {
        return ROM_TYPES[ctx.header.type];
    }
    return "UNKNOWN";
}

bool cart_load(c8 *filename) {
  printf("Trying to open %s file...\r\n", filename);

  u8 fp = DOS_FOpen(filename, O_RDONLY);
  if (fp == HANDLE_INVALID) {
    printf("Failed to open: %s\r\n", filename);
    return false;
  }
  printf("Opened: %s\r\n", filename);

  // Get file size
  ctx.rom_size = DOS_SeekHandle(fp, 0, SEEK_END);
  printf("File Size: %d KB\r\n", (u16)(ctx.rom_size / 1024L));
  DOS_SeekHandle(fp, 0, SEEK_SET);

  // Sanity check
  if (ctx.rom_size == 0) {
    printf("Error: ROM size is 0\r\n");
    DOS_FClose(fp);
    return false;
  }

  // Calculate how many 16KB mapper segments we need
  ctx.num_segments = (u8)((ctx.rom_size + SEG_SIZE - 1) / SEG_SIZE);
  if (ctx.num_segments > MAX_SEGMENTS) {
    printf("Error: ROM too large (%d segments, max %d)\r\n", ctx.num_segments, MAX_SEGMENTS);
    DOS_FClose(fp);
    return false;
  }
  printf("Segments needed: %d\r\n", ctx.num_segments);

  // Initialize mapper
  if (!DOSMapper_Init()) {
    printf("Error: mapper init failed\r\n");
    DOS_FClose(fp);
    return false;
  }

  // Allocate mapper segments
  u8 i;
  for (i = 0; i < ctx.num_segments; i++) {
    // DOS_SEGSLOT_OTHERFIRST: prefer other slots first so we don't
    // compete with DOS2 system segments on the primary mapper
    if (!DOSMapper_Alloc(DOS_ALLOC_USER, DOS_SEGSLOT_PRIM | DOS_SEGSLOT_OTHERFIRST, &ctx.segments[i])) {
      printf("Error: failed to allocate segment %d\r\n", i);
      DOS_FClose(fp);
      return false;
    }
    printf("Segment %d allocated (slot=%d num=%d)\r\n", i, ctx.segments[i].Slot, ctx.segments[i].Number);
  }

  // Load ROM: read byte by byte into mapper segments via DOSMapper_WriteByte.
  // DOSMapper_WriteByte handles segment switching internally — no hardcoded
  // page addresses needed, safe regardless of where our program lives.
  printf("Loading ROM into mapper segments...\r\n");
  u32 addr;
  for (addr = 0; addr < ctx.rom_size; addr++) {
    u8 byte;
    DOS_FRead(fp, &byte, 1);
    u8  seg    = (u8)(addr / SEG_SIZE);
    u16 offset = (u16)(addr % SEG_SIZE);
    DOSMapper_WriteByte(ctx.segments[seg].Number, offset, byte);
  }
  printf("Done loading ROM\r\n");

  DOS_FClose(fp);

  // Copy header locally so it's always readable without touching the mapper
  // Header is at ROM offset 0x100, which is in segment 0 at offset 0x100
  u8 *hdst = (u8*)&ctx.header;
  u16 j;
  for (j = 0; j < sizeof(rom_header); j++) {
    hdst[j] = DOSMapper_ReadByte(ctx.segments[0].Number, 0x100 + j);
  }
  ctx.header.title[15] = 0;

  printf("Cartridge Loaded:\r\n");
  printf("\t Title    : %s\r\n",  ctx.header.title);
  printf("\t Type     : %d (%s)\r\n", ctx.header.type, cart_type_name());
  printf("\t ROM Size : %d KB\r\n", 32 << ctx.header.rom_size);
  printf("\t RAM Size : %d\r\n",  ctx.header.ram_size);
  printf("\t LIC Code : %d (%s)\r\n", ctx.header.lic_code, cart_lic_name());
  printf("\t ROM Vers : %d\r\n",  ctx.header.version);

  return true;
}

// Read a byte from the full GB ROM address space (0x0000 ~ rom_size-1).
// The CPU calls this for addresses 0x0000~0x7FFF (ROM banks 0 and 1).
// DOSMapper_ReadByte switches the segment internally — no manual page mapping needed.
u8 cart_read(u16 address) {
  u8  seg    = (u8)((u32)address / SEG_SIZE);
  u16 offset = address % SEG_SIZE;
  return DOSMapper_ReadByte(ctx.segments[seg].Number, offset);
}

void cart_write(u16 address, u8 value) {
  // MBC register writes will go here when MBC support is added
  printf("cart_write(0x%04X, 0x%02X)\r\n", address, value);
}
