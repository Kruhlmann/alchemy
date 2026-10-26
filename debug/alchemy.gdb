set pagination off
set disassembly-flavor intel
set breakpoint pending on

break usr_main

define hook-stop
    if $_thread != 0
        printf "Stack (top first):\n"
        set $i = 0
        while $i < 4
            set $addr = $rsp + $i * 8
            set $value = *(long long *)$addr
            printf "%p:  0x%016llx  %lld\n", $addr, $value, $value
            set $i = $i + 1
        end
    end
end

tui new-layout dev {-horizontal {src 2 regs 1} 1 asm 1} 3 status 0 cmd 1
layout dev
tui reg general
focus cmd
run
