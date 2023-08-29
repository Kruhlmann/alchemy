import { Instruction } from "../instruction";

export class PokeInstruction extends Instruction {
    public to_asm(_instruction_index: number): string {
        return "pop rax\n pop rbx\nadd rsp, rax\nmov [rsp], rbx\nsub rsp, rax"
    }
    public to_wat(_instruction_index: number): string {
        throw new Error("Method not implemented.");
    }
}
