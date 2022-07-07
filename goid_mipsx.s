//go:build mips || mipsle
// +build mips mipsle

#include "go_asm.h"
#include "textflag.h"

TEXT ·getg(SB), NOSPLIT, $0-4
    MOVW    g, ret+0(FP)
    RET
