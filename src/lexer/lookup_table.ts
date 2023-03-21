import {
    AddInstruction,
    BitwiseAndInstruction,
    BitwiseOrInstruction,
    CloneInstruction,
    DecrementInstruction,
    EndIfInstruction,
    EqualityInstruction,
    GreaterThanInstruction,
    IncrementInstruction,
    Instruction,
    LeftBinaryShiftInstruction,
    LessThanInstruction,
    LoadMemoryInstruction,
    PushMemoryPointerInstruction,
    PutInstruction,
    RightBinaryShiftInstruction,
    SubtractInstruction,
    Syscall1Instruction,
    Syscall3Instruction,
    UnreferencedDoInstruction,
    UnreferencedElseInstruction,
    UnreferencedIfInstruction,
    UnreferencedUnlessInstruction,
    UnreferencedWendInstruction,
    WhileInstruction,
    WriteMemoryInstruction,
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
        clone: CloneInstruction,
        write: WriteMemoryInstruction,
        load: LoadMemoryInstruction,
        mem: PushMemoryPointerInstruction,
        do: UnreferencedDoInstruction,
        if: UnreferencedIfInstruction,
        unless: UnreferencedUnlessInstruction,
        endif: EndIfInstruction,
        else: UnreferencedElseInstruction,
        put: PutInstruction,
        syscall1: Syscall1Instruction,
        syscall3: Syscall3Instruction,
        while: WhileInstruction,
        wend: UnreferencedWendInstruction,
    };

    public static lookup(instruction_name: string): Instruction | undefined {
        const InstructionConstructor = this.instructions_by_symbol[instruction_name];
        if (!InstructionConstructor) {
            return undefined;
        }
        return new InstructionConstructor();
    }
}
