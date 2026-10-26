set disassembly-flavor intel

define hook-stop
    x/gx $rsp
    x/gx ($rsp + 8)
    x/gx ($rsp + 16)
    x/gx ($rsp + 24)
end

break _start
run
layout asm
layout regs
