#include "cpu.h"
#include "bus.h"
#include "dbg.h"
#include "emu.h"
#include "interrupts.h"
#include "timer.h"
#include "stack.h"

static cpu_context ctx;

#define CPU_DEBUG 0

void cpu_init() {
  ctx.regs.pc = 0x100;
  ctx.regs.sp = 0xFFFE;
  *((short *)&ctx.regs.a) = 0xB001;
  *((short *)&ctx.regs.b) = 0x1300;
  *((short *)&ctx.regs.d) = 0xD800;
  *((short *)&ctx.regs.h) = 0x4D01;
  ctx.ie_register = 0;
  ctx.int_flags = 0;
  ctx.int_master_enabled = false;
  ctx.enabling_ime = false;

  timer_get_context()->div = 0xABCC;
}

static void fetch_instruction() {
  ctx.cur_opcode = bus_read(ctx.regs.pc++);
  ctx.cur_inst = instruction_by_opcode(ctx.cur_opcode);
}

void fetch_data();

static void execute() {
  IN_PROC proc = inst_get_processor(ctx.cur_inst->type);

  if (!proc) {
    NO_IMPL
  }

  proc(&ctx);
}

bool cpu_step() {

  if (!ctx.halted) {
    u16 pc = ctx.regs.pc;

    fetch_instruction();
    emu_cycles(1);
    fetch_data();

#if CPU_DEBUG == 1
    char flags[16];
    sprintf(flags, "%c%c%c%c", ctx.regs.f & (1 << 7) ? 'Z' : '-',
            ctx.regs.f & (1 << 6) ? 'N' : '-',
            ctx.regs.f & (1 << 5) ? 'H' : '-',
            ctx.regs.f & (1 << 4) ? 'C' : '-');

    char inst[16];
    inst_to_str(&ctx, inst);

    printf("%08lX - %04X: %-12s (%02X %02X %02X) A: %02X F: %s BC: %02X%02X "
           "DE: %02X%02X HL: %02X%02X\n",
           emu_get_context()->ticks, pc, inst, ctx.cur_opcode, bus_read(pc + 1),
           bus_read(pc + 2), ctx.regs.a, flags, ctx.regs.b, ctx.regs.c,
           ctx.regs.d, ctx.regs.e, ctx.regs.h, ctx.regs.l);
#endif

    if (ctx.cur_inst == NULL) {
      printf("Unknown Instruction! %02X\n", ctx.cur_opcode);
      exit(-7);
    }

    dbg_update();
    dbg_print();

    execute();
  } else {
    // is halted...
    emu_cycles(1);

    if (ctx.int_flags) {
      ctx.halted = false;
    }
  }

  if (ctx.int_master_enabled) {
    cpu_handle_interrupts(&ctx);
    ctx.enabling_ime = false;
  }

  if (ctx.enabling_ime) {
    ctx.int_master_enabled = true;
  }

  return true;
}

u8 cpu_get_ie_register() { return ctx.ie_register; }

void cpu_set_ie_register(u8 n) { ctx.ie_register = n; }

void cpu_request_interrupt(interrupt_type t) { ctx.int_flags |= t; }

u16 reverse(u16 n) { return ((n & 0xFF00) >> 8) | ((n & 0x00FF) << 8); }

u16 cpu_read_reg(reg_type rt) {
  switch (rt) {
  case RT_A:
    return ctx.regs.a;
  case RT_F:
    return ctx.regs.f;
  case RT_B:
    return ctx.regs.b;
  case RT_C:
    return ctx.regs.c;
  case RT_D:
    return ctx.regs.d;
  case RT_E:
    return ctx.regs.e;
  case RT_H:
    return ctx.regs.h;
  case RT_L:
    return ctx.regs.l;

  case RT_AF:
    return reverse(*((u16 *)&ctx.regs.a));
  case RT_BC:
    return reverse(*((u16 *)&ctx.regs.b));
  case RT_DE:
    return reverse(*((u16 *)&ctx.regs.d));
  case RT_HL:
    return reverse(*((u16 *)&ctx.regs.h));

  case RT_PC:
    return ctx.regs.pc;
  case RT_SP:
    return ctx.regs.sp;
  default:
    return 0;
  }
}

void cpu_set_reg(reg_type rt, u16 val) {
  switch (rt) {
  case RT_A:
    ctx.regs.a = val & 0xFF;
    break;
  case RT_F:
    ctx.regs.f = val & 0xFF;
    break;
  case RT_B:
    ctx.regs.b = val & 0xFF;
    break;
  case RT_C: {
    ctx.regs.c = val & 0xFF;
  } break;
  case RT_D:
    ctx.regs.d = val & 0xFF;
    break;
  case RT_E:
    ctx.regs.e = val & 0xFF;
    break;
  case RT_H:
    ctx.regs.h = val & 0xFF;
    break;
  case RT_L:
    ctx.regs.l = val & 0xFF;
    break;

  case RT_AF:
    *((u16 *)&ctx.regs.a) = reverse(val);
    break;
  case RT_BC:
    *((u16 *)&ctx.regs.b) = reverse(val);
    break;
  case RT_DE:
    *((u16 *)&ctx.regs.d) = reverse(val);
    break;
  case RT_HL: {
    *((u16 *)&ctx.regs.h) = reverse(val);
    break;
  }

  case RT_PC:
    ctx.regs.pc = val;
    break;
  case RT_SP:
    ctx.regs.sp = val;
    break;
  case RT_NONE:
    break;
  }
}

u8 cpu_read_reg8(reg_type rt) {
  switch (rt) {
  case RT_A:
    return ctx.regs.a;
  case RT_F:
    return ctx.regs.f;
  case RT_B:
    return ctx.regs.b;
  case RT_C:
    return ctx.regs.c;
  case RT_D:
    return ctx.regs.d;
  case RT_E:
    return ctx.regs.e;
  case RT_H:
    return ctx.regs.h;
  case RT_L:
    return ctx.regs.l;
  case RT_HL: {
    return bus_read(cpu_read_reg(RT_HL));
  }
  default:
    printf("**ERR INVALID REG8: %d\n", rt);
    NO_IMPL
  }
}

void cpu_set_reg8(reg_type rt, u8 val) {
  switch (rt) {
  case RT_A:
    ctx.regs.a = val & 0xFF;
    break;
  case RT_F:
    ctx.regs.f = val & 0xFF;
    break;
  case RT_B:
    ctx.regs.b = val & 0xFF;
    break;
  case RT_C:
    ctx.regs.c = val & 0xFF;
    break;
  case RT_D:
    ctx.regs.d = val & 0xFF;
    break;
  case RT_E:
    ctx.regs.e = val & 0xFF;
    break;
  case RT_H:
    ctx.regs.h = val & 0xFF;
    break;
  case RT_L:
    ctx.regs.l = val & 0xFF;
    break;
  case RT_HL:
    bus_write(cpu_read_reg(RT_HL), val);
    break;
  default:
    printf("**ERR INVALID REG8: %d\n", rt);
    NO_IMPL
  }
}

cpu_registers *cpu_get_regs() { return &ctx.regs; }

u8 cpu_get_int_flags() { return ctx.int_flags; }

void cpu_set_int_flags(u8 value) { ctx.int_flags = value; }

void fetch_data() {
  ctx.mem_dest = 0;
  ctx.dest_is_mem = false;

  if (ctx.cur_inst == NULL) {
    return;
  }

  switch (ctx.cur_inst->mode) {
  case AM_IMP:
    return;

  case AM_R:
    ctx.fetched_data = cpu_read_reg(ctx.cur_inst->reg_1);
    return;

  case AM_R_R:
    ctx.fetched_data = cpu_read_reg(ctx.cur_inst->reg_2);
    return;

  case AM_R_D8:
    ctx.fetched_data = bus_read(ctx.regs.pc);
    emu_cycles(1);
    ctx.regs.pc++;
    return;

  case AM_R_D16:
  case AM_D16: {
    u16 lo = bus_read(ctx.regs.pc);
    emu_cycles(1);

    u16 hi = bus_read(ctx.regs.pc + 1);
    emu_cycles(1);

    ctx.fetched_data = lo | (hi << 8);

    ctx.regs.pc += 2;

    return;
  }

  case AM_MR_R:
    ctx.fetched_data = cpu_read_reg(ctx.cur_inst->reg_2);
    ctx.mem_dest = cpu_read_reg(ctx.cur_inst->reg_1);
    ctx.dest_is_mem = true;

    if (ctx.cur_inst->reg_1 == RT_C) {
      ctx.mem_dest |= 0xFF00;
    }

    return;

  case AM_R_MR: {
    u16 addr = cpu_read_reg(ctx.cur_inst->reg_2);

    if (ctx.cur_inst->reg_2 == RT_C) {
      addr |= 0xFF00;
    }

    ctx.fetched_data = bus_read(addr);
    emu_cycles(1);
  }
    return;

  case AM_R_HLI:
    ctx.fetched_data = bus_read(cpu_read_reg(ctx.cur_inst->reg_2));
    emu_cycles(1);
    cpu_set_reg(RT_HL, cpu_read_reg(RT_HL) + 1);
    return;

  case AM_R_HLD:
    ctx.fetched_data = bus_read(cpu_read_reg(ctx.cur_inst->reg_2));
    emu_cycles(1);
    cpu_set_reg(RT_HL, cpu_read_reg(RT_HL) - 1);
    return;

  case AM_HLI_R:
    ctx.fetched_data = cpu_read_reg(ctx.cur_inst->reg_2);
    ctx.mem_dest = cpu_read_reg(ctx.cur_inst->reg_1);
    ctx.dest_is_mem = true;
    cpu_set_reg(RT_HL, cpu_read_reg(RT_HL) + 1);
    return;

  case AM_HLD_R:
    ctx.fetched_data = cpu_read_reg(ctx.cur_inst->reg_2);
    ctx.mem_dest = cpu_read_reg(ctx.cur_inst->reg_1);
    ctx.dest_is_mem = true;
    cpu_set_reg(RT_HL, cpu_read_reg(RT_HL) - 1);
    return;

  case AM_R_A8:
    ctx.fetched_data = bus_read(ctx.regs.pc);
    emu_cycles(1);
    ctx.regs.pc++;
    return;

  case AM_A8_R:
    ctx.mem_dest = bus_read(ctx.regs.pc) | 0xFF00;
    ctx.dest_is_mem = true;
    emu_cycles(1);
    ctx.regs.pc++;
    return;

  case AM_HL_SPR:
    ctx.fetched_data = bus_read(ctx.regs.pc);
    emu_cycles(1);
    ctx.regs.pc++;
    return;

  case AM_D8:
    ctx.fetched_data = bus_read(ctx.regs.pc);
    emu_cycles(1);
    ctx.regs.pc++;
    return;

  case AM_A16_R:
  case AM_D16_R: {
    u16 lo = bus_read(ctx.regs.pc);
    emu_cycles(1);

    u16 hi = bus_read(ctx.regs.pc + 1);
    emu_cycles(1);

    ctx.mem_dest = lo | (hi << 8);
    ctx.dest_is_mem = true;

    ctx.regs.pc += 2;
    ctx.fetched_data = cpu_read_reg(ctx.cur_inst->reg_2);
  }
    return;

  case AM_MR_D8:
    ctx.fetched_data = bus_read(ctx.regs.pc);
    emu_cycles(1);
    ctx.regs.pc++;
    ctx.mem_dest = cpu_read_reg(ctx.cur_inst->reg_1);
    ctx.dest_is_mem = true;
    return;

  case AM_MR:
    ctx.mem_dest = cpu_read_reg(ctx.cur_inst->reg_1);
    ctx.dest_is_mem = true;
    ctx.fetched_data = bus_read(cpu_read_reg(ctx.cur_inst->reg_1));
    emu_cycles(1);
    return;

  case AM_R_A16: {
    u16 lo = bus_read(ctx.regs.pc);
    emu_cycles(1);

    u16 hi = bus_read(ctx.regs.pc + 1);
    emu_cycles(1);

    u16 addr = lo | (hi << 8);

    ctx.regs.pc += 2;
    ctx.fetched_data = bus_read(addr);
    emu_cycles(1);

    return;
  }

  default:
    printf("Unknown Addressing Mode! %d (%02X)\n", ctx.cur_inst->mode,
           ctx.cur_opcode);
    exit(-7);
    return;
  }
}

void cpu_set_flags(cpu_context *ctx, i8 z, i8 n, i8 h, i8 c) {
  if (z != -1) {
    MSX_BIT_SET(ctx->regs.f, 7, z);
  }

  if (n != -1) {
    MSX_BIT_SET(ctx->regs.f, 6, n);
  }

  if (h != -1) {
    MSX_BIT_SET(ctx->regs.f, 5, h);
  }

  if (c != -1) {
    MSX_BIT_SET(ctx->regs.f, 4, c);
  }
}

static void proc_none(cpu_context *ctx) {
  printf("INVALID INSTRUCTION!\n");
  exit(-7);
}

static void proc_nop(cpu_context *ctx) {}

reg_type rt_lookup[] = {RT_B, RT_C, RT_D, RT_E, RT_H, RT_L, RT_HL, RT_A};

reg_type decode_reg(u8 reg) {
  if (reg > 0b111) {
    return RT_NONE;
  }

  return rt_lookup[reg];
}

static void proc_cb(cpu_context *ctx) {
  u8 op = ctx->fetched_data;
  reg_type reg = decode_reg(op & 0b111);
  u8 bit = (op >> 3) & 0b111;
  u8 bit_op = (op >> 6) & 0b11;
  u8 reg_val = cpu_read_reg8(reg);

  emu_cycles(1);

  if (reg == RT_HL) {
    emu_cycles(2);
  }

  switch (bit_op) {
  case 1:
    // BIT
    cpu_set_flags(ctx, !(reg_val & (1 << bit)), 0, 1, -1);
    return;

  case 2:
    // RST
    reg_val &= ~(1 << bit);
    cpu_set_reg8(reg, reg_val);
    return;

  case 3:
    // SET
    reg_val |= (1 << bit);
    cpu_set_reg8(reg, reg_val);
    return;
  }

  bool flagC = CPU_FLAG_C;

  switch (bit) {
  case 0: {
    // RLC
    bool setC = false;
    u8 result = (reg_val << 1) & 0xFF;

    if ((reg_val & (1 << 7)) != 0) {
      result |= 1;
      setC = true;
    }

    cpu_set_reg8(reg, result);
    cpu_set_flags(ctx, result == 0, false, false, setC);
  }
    return;
  case 1: {
    // RRC
    u8 old = reg_val;
    reg_val >>= 1;
    reg_val |= (old << 7);

    cpu_set_reg8(reg, reg_val);
    cpu_set_flags(ctx, !reg_val, false, false, old & 1);
  }
    return;
  case 2: {
    // RL
    u8 old = reg_val;
    reg_val <<= 1;
    reg_val |= flagC;

    cpu_set_reg8(reg, reg_val);
    cpu_set_flags(ctx, !reg_val, false, false, !!(old & 0x80));
  }
    return;
  case 3: {
    // RR
    u8 old = reg_val;
    reg_val >>= 1;

    reg_val |= (flagC << 7);

    cpu_set_reg8(reg, reg_val);
    cpu_set_flags(ctx, !reg_val, false, false, old & 1);
  }
    return;
  case 4: {
    // SLA
    u8 old = reg_val;
    reg_val <<= 1;

    cpu_set_reg8(reg, reg_val);
    cpu_set_flags(ctx, !reg_val, false, false, !!(old & 0x80));
  }
    return;
  case 5: {
    // SRA
    u8 u = (i8)reg_val >> 1;
    cpu_set_reg8(reg, u);
    cpu_set_flags(ctx, !u, 0, 0, reg_val & 1);
  }
    return;
  case 6: {
    // SWAP
    reg_val = ((reg_val & 0xF0) >> 4) | ((reg_val & 0xF) << 4);
    cpu_set_reg8(reg, reg_val);
    cpu_set_flags(ctx, reg_val == 0, false, false, false);
  }
    return;
  case 7: {
    // SRL
    u8 u = reg_val >> 1;
    cpu_set_reg8(reg, u);
    cpu_set_flags(ctx, !u, 0, 0, reg_val & 1);
  }
    return;
  }

  printf("ERROR: INVALID CB: %02X", op);
  NO_IMPL
}

static void proc_rlca(cpu_context *ctx) {
    u8 u = ctx->regs.a;
    bool c = (u >> 7) & 1;
    u = (u << 1) | c;
    ctx->regs.a = u;

    cpu_set_flags(ctx, 0, 0, 0, c);
}

static void proc_rrca(cpu_context *ctx) {
    u8 b = ctx->regs.a & 1;
    ctx->regs.a >>= 1;
    ctx->regs.a |= (b << 7);

    cpu_set_flags(ctx, 0, 0, 0, b);
}


static void proc_rla(cpu_context *ctx) {
    u8 u = ctx->regs.a;
    u8 cf = CPU_FLAG_C;
    u8 c = (u >> 7) & 1;

    ctx->regs.a = (u << 1) | cf;
    cpu_set_flags(ctx, 0, 0, 0, c);
}

static void proc_stop(cpu_context *ctx) {
    printf("STOPPING!\n");
    NO_IMPL
}

static void proc_daa(cpu_context *ctx) {
    u8 u = 0;
    int fc = 0;

    if (CPU_FLAG_H || (!CPU_FLAG_N && (ctx->regs.a & 0xF) > 9)) {
        u = 6;
    }

    if (CPU_FLAG_C || (!CPU_FLAG_N && ctx->regs.a > 0x99)) {
        u |= 0x60;
        fc = 1;
    }

    ctx->regs.a += CPU_FLAG_N ? -u : u;

    cpu_set_flags(ctx, ctx->regs.a == 0, -1, 0, fc);
}

static void proc_cpl(cpu_context *ctx) {
    ctx->regs.a = ~ctx->regs.a;
    cpu_set_flags(ctx, -1, 1, 1, -1);
}

static void proc_scf(cpu_context *ctx) {
    cpu_set_flags(ctx, -1, 0, 0, 1);
}

static void proc_ccf(cpu_context *ctx) {
    cpu_set_flags(ctx, -1, 0, 0, CPU_FLAG_C ^ 1);
}

static void proc_halt(cpu_context *ctx) {
    ctx->halted = true;
}

static void proc_rra(cpu_context *ctx) {
    u8 carry = CPU_FLAG_C;
    u8 new_c = ctx->regs.a & 1;

    ctx->regs.a >>= 1;
    ctx->regs.a |= (carry << 7);

    cpu_set_flags(ctx, 0, 0, 0, new_c);
}

static void proc_and(cpu_context *ctx) {
    ctx->regs.a &= ctx->fetched_data;
    cpu_set_flags(ctx, ctx->regs.a == 0, 0, 1, 0);
}

static void proc_xor(cpu_context *ctx) {
    ctx->regs.a ^= ctx->fetched_data & 0xFF;
    cpu_set_flags(ctx, ctx->regs.a == 0, 0, 0, 0);
}

static void proc_or(cpu_context *ctx) {
    ctx->regs.a |= ctx->fetched_data & 0xFF;
    cpu_set_flags(ctx, ctx->regs.a == 0, 0, 0, 0);
}

static void proc_cp(cpu_context *ctx) {
    int n = (int)ctx->regs.a - (int)ctx->fetched_data;

    cpu_set_flags(ctx, n == 0, 1, 
        ((int)ctx->regs.a & 0x0F) - ((int)ctx->fetched_data & 0x0F) < 0, n < 0);
}

static void proc_di(cpu_context *ctx) {
    ctx->int_master_enabled = false;
}

static void proc_ei(cpu_context *ctx) {
    ctx->enabling_ime = true;
}

static bool is_16_bit(reg_type rt) {
    return rt >= RT_AF;
}

static void proc_ld(cpu_context *ctx) {
    if (ctx->dest_is_mem) {
        //LD (BC), A for instance...

        if (is_16_bit(ctx->cur_inst->reg_2)) {
            //if 16 bit register...
            emu_cycles(1);
            bus_write16(ctx->mem_dest, ctx->fetched_data);
        } else {
            bus_write(ctx->mem_dest, ctx->fetched_data);
        }

        emu_cycles(1);

        return;
    }

    if (ctx->cur_inst->mode == AM_HL_SPR) {
        u8 hflag = (cpu_read_reg(ctx->cur_inst->reg_2) & 0xF) + 
            (ctx->fetched_data & 0xF) >= 0x10;

        u8 cflag = (cpu_read_reg(ctx->cur_inst->reg_2) & 0xFF) + 
            (ctx->fetched_data & 0xFF) >= 0x100;

        cpu_set_flags(ctx, 0, 0, hflag, cflag);
        cpu_set_reg(ctx->cur_inst->reg_1, 
            cpu_read_reg(ctx->cur_inst->reg_2) + (i8)ctx->fetched_data);

        return;
    }

    cpu_set_reg(ctx->cur_inst->reg_1, ctx->fetched_data);
}

static void proc_ldh(cpu_context *ctx) {
    if (ctx->cur_inst->reg_1 == RT_A) {
        cpu_set_reg(ctx->cur_inst->reg_1, bus_read(0xFF00 | ctx->fetched_data));
    } else {
        bus_write(ctx->mem_dest, ctx->regs.a);
    }

    emu_cycles(1);
}


static bool check_cond(cpu_context *ctx) {
    bool z = CPU_FLAG_Z;
    bool c = CPU_FLAG_C;

    switch(ctx->cur_inst->cond) {
        case CT_NONE: return true;
        case CT_C: return c;
        case CT_NC: return !c;
        case CT_Z: return z;
        case CT_NZ: return !z;
    }

    return false;
}

static void goto_addr(cpu_context *ctx, u16 addr, bool pushpc) {
    if (check_cond(ctx)) {
        if (pushpc) {
            emu_cycles(2);
            stack_push16(ctx->regs.pc);
        }

        ctx->regs.pc = addr;
        emu_cycles(1);
    }
}

static void proc_jp(cpu_context *ctx) {
    goto_addr(ctx, ctx->fetched_data, false);
}

static void proc_jr(cpu_context *ctx) {
    i8 rel = (i8)(ctx->fetched_data & 0xFF);
    u16 addr = ctx->regs.pc + rel;
    goto_addr(ctx, addr, false);
}

static void proc_call(cpu_context *ctx) {
    goto_addr(ctx, ctx->fetched_data, true);
}

static void proc_rst(cpu_context *ctx) {
    goto_addr(ctx, ctx->cur_inst->param, true);
}

static void proc_ret(cpu_context *ctx) {
    if (ctx->cur_inst->cond != CT_NONE) {
        emu_cycles(1);
    }

    if (check_cond(ctx)) {
        u16 lo = stack_pop();
        emu_cycles(1);
        u16 hi = stack_pop();
        emu_cycles(1);

        u16 n = (hi << 8) | lo;
        ctx->regs.pc = n;

        emu_cycles(1);
    }
}

static void proc_reti(cpu_context *ctx) {
    ctx->int_master_enabled = true;
    proc_ret(ctx);
}

static void proc_pop(cpu_context *ctx) {
    u16 lo = stack_pop();
    emu_cycles(1);
    u16 hi = stack_pop();
    emu_cycles(1);

    u16 n = (hi << 8) | lo;

    cpu_set_reg(ctx->cur_inst->reg_1, n);

    if (ctx->cur_inst->reg_1 == RT_AF) {
        cpu_set_reg(ctx->cur_inst->reg_1, n & 0xFFF0);
    }
}

static void proc_push(cpu_context *ctx) {
    u16 hi = (cpu_read_reg(ctx->cur_inst->reg_1) >> 8) & 0xFF;
    emu_cycles(1);
    stack_push(hi);

    u16 lo = cpu_read_reg(ctx->cur_inst->reg_1) & 0xFF;
    emu_cycles(1);
    stack_push(lo);
    
    emu_cycles(1);
}

static void proc_inc(cpu_context *ctx) {
    u16 val = cpu_read_reg(ctx->cur_inst->reg_1) + 1;

    if (is_16_bit(ctx->cur_inst->reg_1)) {
        emu_cycles(1);
    }

    if (ctx->cur_inst->reg_1 == RT_HL && ctx->cur_inst->mode == AM_MR) {
        val = bus_read(cpu_read_reg(RT_HL)) + 1;
        val &= 0xFF;
        bus_write(cpu_read_reg(RT_HL), val);
    } else {
        cpu_set_reg(ctx->cur_inst->reg_1, val);
        val = cpu_read_reg(ctx->cur_inst->reg_1);
    }

    if ((ctx->cur_opcode & 0x03) == 0x03) {
        return;
    }

    cpu_set_flags(ctx, val == 0, 0, (val & 0x0F) == 0, -1);
}

static void proc_dec(cpu_context *ctx) {
    u16 val = cpu_read_reg(ctx->cur_inst->reg_1) - 1;

    if (is_16_bit(ctx->cur_inst->reg_1)) {
        emu_cycles(1);
    }

    if (ctx->cur_inst->reg_1 == RT_HL && ctx->cur_inst->mode == AM_MR) {
        val = bus_read(cpu_read_reg(RT_HL)) - 1;
        bus_write(cpu_read_reg(RT_HL), val);
    } else {
        cpu_set_reg(ctx->cur_inst->reg_1, val);
        val = cpu_read_reg(ctx->cur_inst->reg_1);
    }

    if ((ctx->cur_opcode & 0x0B) == 0x0B) {
        return;
    }

    cpu_set_flags(ctx, val == 0, 1, (val & 0x0F) == 0x0F, -1);
}

static void proc_sub(cpu_context *ctx) {
    u16 val = cpu_read_reg(ctx->cur_inst->reg_1) - ctx->fetched_data;

    int z = val == 0;
    int h = ((int)cpu_read_reg(ctx->cur_inst->reg_1) & 0xF) - ((int)ctx->fetched_data & 0xF) < 0;
    int c = ((int)cpu_read_reg(ctx->cur_inst->reg_1)) - ((int)ctx->fetched_data) < 0;

    cpu_set_reg(ctx->cur_inst->reg_1, val);
    cpu_set_flags(ctx, z, 1, h, c);
}

static void proc_sbc(cpu_context *ctx) {
    u8 val = ctx->fetched_data + CPU_FLAG_C;

    int z = cpu_read_reg(ctx->cur_inst->reg_1) - val == 0;

    int h = ((int)cpu_read_reg(ctx->cur_inst->reg_1) & 0xF) 
        - ((int)ctx->fetched_data & 0xF) - ((int)CPU_FLAG_C) < 0;
    int c = ((int)cpu_read_reg(ctx->cur_inst->reg_1)) 
        - ((int)ctx->fetched_data) - ((int)CPU_FLAG_C) < 0;

    cpu_set_reg(ctx->cur_inst->reg_1, cpu_read_reg(ctx->cur_inst->reg_1) - val);
    cpu_set_flags(ctx, z, 1, h, c);
}

static void proc_adc(cpu_context *ctx) {
    u16 u = ctx->fetched_data;
    u16 a = ctx->regs.a;
    u16 c = CPU_FLAG_C;

    ctx->regs.a = (a + u + c) & 0xFF;

    cpu_set_flags(ctx, ctx->regs.a == 0, 0, 
        (a & 0xF) + (u & 0xF) + c > 0xF,
        a + u + c > 0xFF);
}

static void proc_add(cpu_context *ctx) {
    u32 val = cpu_read_reg(ctx->cur_inst->reg_1) + ctx->fetched_data;

    bool is_16bit = is_16_bit(ctx->cur_inst->reg_1);

    if (is_16bit) {
        emu_cycles(1);
    }

    if (ctx->cur_inst->reg_1 == RT_SP) {
        val = cpu_read_reg(ctx->cur_inst->reg_1) + (i8)ctx->fetched_data;
    }

    int z = (val & 0xFF) == 0;
    int h = (cpu_read_reg(ctx->cur_inst->reg_1) & 0xF) + (ctx->fetched_data & 0xF) >= 0x10;
    int c = (int)(cpu_read_reg(ctx->cur_inst->reg_1) & 0xFF) + (int)(ctx->fetched_data & 0xFF) >= 0x100;

    if (is_16bit) {
        z = -1;
        h = (cpu_read_reg(ctx->cur_inst->reg_1) & 0xFFF) + (ctx->fetched_data & 0xFFF) >= 0x1000;
        u32 n = ((u32)cpu_read_reg(ctx->cur_inst->reg_1)) + ((u32)ctx->fetched_data);
        c = n >= 0x10000;
    }

    if (ctx->cur_inst->reg_1 == RT_SP) {
        z = 0;
        h = (cpu_read_reg(ctx->cur_inst->reg_1) & 0xF) + (ctx->fetched_data & 0xF) >= 0x10;
        c = (int)(cpu_read_reg(ctx->cur_inst->reg_1) & 0xFF) + (int)(ctx->fetched_data & 0xFF) >= 0x100;
    }

    cpu_set_reg(ctx->cur_inst->reg_1, val & 0xFFFF);
    cpu_set_flags(ctx, z, 0, h, c);
}

static IN_PROC processors[] = {
    [IN_NONE] = proc_none,
    [IN_NOP] = proc_nop,
    [IN_LD] = proc_ld,
    [IN_LDH] = proc_ldh,
    [IN_JP] = proc_jp,
    [IN_DI] = proc_di,
    [IN_POP] = proc_pop,
    [IN_PUSH] = proc_push,
    [IN_JR] = proc_jr,
    [IN_CALL] = proc_call,
    [IN_RET] = proc_ret,
    [IN_RST] = proc_rst,
    [IN_DEC] = proc_dec,
    [IN_INC] = proc_inc,
    [IN_ADD] = proc_add,
    [IN_ADC] = proc_adc,
    [IN_SUB] = proc_sub,
    [IN_SBC] = proc_sbc,
    [IN_AND] = proc_and,
    [IN_XOR] = proc_xor,
    [IN_OR] = proc_or,
    [IN_CP] = proc_cp,
    [IN_CB] = proc_cb,
    [IN_RRCA] = proc_rrca,
    [IN_RLCA] = proc_rlca,
    [IN_RRA] = proc_rra,
    [IN_RLA] = proc_rla,
    [IN_STOP] = proc_stop,
    [IN_HALT] = proc_halt,
    [IN_DAA] = proc_daa,
    [IN_CPL] = proc_cpl,
    [IN_SCF] = proc_scf,
    [IN_CCF] = proc_ccf,
    [IN_EI] = proc_ei,
    [IN_RETI] = proc_reti
};

IN_PROC inst_get_processor(in_type type) {
    return processors[type];
  }
