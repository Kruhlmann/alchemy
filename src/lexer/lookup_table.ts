import {
    AddInstruction,
    BitwiseAndInstruction,
    BitwiseOrInstruction,
    Clone2Instruction,
    CloneInstruction,
    DecrementInstruction,
    DropInstruction,
    EndIfInstruction,
    EqualityInstruction,
    GreaterThanInstruction,
    IncrementInstruction,
    Instruction,
    LeftBinaryShiftInstruction,
    LessThanInstruction,
    LoadMemoryInstruction,
    MarineInstruction,
    OverInstruction,
    PushMemoryPointerInstruction,
    PushSyscallReturnValue,
    PutInstruction,
    ReadByteInstruction,
    ReadWordInstruction,
    ReadDWordInstruction,
    ReadQWordInstruction,
    Rev3Instruction,
    Rev4Instruction,
    RightBinaryShiftInstruction,
    SCopyInstruction,
    ShiftDownInstruction,
    ShiftUpInstruction,
    SubtractInstruction,
    SwapInstruction,
    Syscall1Instruction,
    Syscall3Instruction,
    SyscallInstruction,
    UnreferencedDoInstruction,
    UnreferencedElseInstruction,
    UnreferencedIfInstruction,
    UnreferencedSubInstruction,
    UnreferencedUnlessInstruction,
    UnreferencedWendInstruction,
    WhileInstruction,
    WriteMemoryInstruction,
    WriteByteMemoryInstruction,
    WriteDWordMemoryInstruction,
    WriteWordMemoryInstruction,
    WriteQWordMemoryInstruction,
} from "../instruction";

export class InstructionLookupTable {
    protected static instructions_by_symbol: Record<string, new () => Instruction> = {
        "+": AddInstruction,
        "-": SubtractInstruction,
        ">": GreaterThanInstruction,
        "<": LessThanInstruction,
        "=": EqualityInstruction,
        "|": BitwiseOrInstruction,
        "&": BitwiseAndInstruction,
        "<<": LeftBinaryShiftInstruction,
        ">>": RightBinaryShiftInstruction,
        "--": DecrementInstruction,
        "++": IncrementInstruction,
        "2clone": Clone2Instruction,
        clone: CloneInstruction,
        do: UnreferencedDoInstruction,
        drop: DropInstruction,
        else: UnreferencedElseInstruction,
        endif: EndIfInstruction,
        if: UnreferencedIfInstruction,
        load: LoadMemoryInstruction,
        marine: MarineInstruction,
        mem: PushMemoryPointerInstruction,
        over: OverInstruction,
        put: PutInstruction,
        readb: ReadByteInstruction,
        readd: ReadDWordInstruction,
        readq: ReadQWordInstruction,
        readw: ReadWordInstruction,
        rev3: Rev3Instruction,
        rev4: Rev4Instruction,
        scopy: SCopyInstruction,
        shiftd: ShiftDownInstruction,
        shiftu: ShiftUpInstruction,
        sub: UnreferencedSubInstruction,
        swap: SwapInstruction,
        syscall1: Syscall1Instruction,
        syscall3: Syscall3Instruction,
        syscall: SyscallInstruction,
        sysread: PushSyscallReturnValue,
        unless: UnreferencedUnlessInstruction,
        wend: UnreferencedWendInstruction,
        while: WhileInstruction,
        write: WriteMemoryInstruction,
        writeb: WriteByteMemoryInstruction,
        writed: WriteDWordMemoryInstruction,
        writeq: WriteQWordMemoryInstruction,
        writew: WriteWordMemoryInstruction,
    };

    public static lookup(instruction_name: string): Instruction | undefined {
        const InstructionConstructor = this.instructions_by_symbol[instruction_name];
        if (!InstructionConstructor) {
            return undefined;
        }
        return new InstructionConstructor();
    }
}
