#pragma once

#include "dos.h"
#include "string.h"

// buffer for string manipulation
static c8 g_StrBuffer[128];

#define printf(fmt, ...) \
    String_Format(g_StrBuffer, fmt "$", ##__VA_ARGS__); \
    DOS_StringOutput(g_StrBuffer)

