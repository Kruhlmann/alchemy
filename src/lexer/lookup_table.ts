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
    OverInstruction,
    PushMemoryPointerInstruction,
    PutInstruction,
    Rev3Instruction,
    Rev4Instruction,
    RightBinaryShiftInstruction,
    SubtractInstruction,
    SwapInstruction,
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
        "2clone": Clone2Instruction,
        rev3: Rev3Instruction,
        rev4: Rev4Instruction,
        drop: DropInstruction,
        swap: SwapInstruction,
        clone: CloneInstruction,
        over: OverInstruction,
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
