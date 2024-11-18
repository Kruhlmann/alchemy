import { CrossReferencer } from "../../../cross_referencer";
import { InstructionsPruner } from "../../../include_pruner";
import { Instruction } from "../../../instruction";
import { AlchemySource, Lexer } from "../../../lexer";
import { Logger } from "../../../logger";
import { CompilationResult } from "../../result";
import { AlchemyCompiler } from "../alchemy";

export class Amd64AlchemyCompiler implements AlchemyCompiler {
    public static ASM_HEADER = `global _start
segment .text
print:
mov rax, 1
syscall
ret
dump:
mov r9, -3689348814741910323
sub rsp, 40
mov BYTE [rsp+31], 10
lea rcx, [rsp+30]
.dump_loop:
mov rax, rdi
lea r8, [rsp+32]
mul r9
mov rax, rdi
sub r8, rcx
shr rdx, 3
lea rsi, [rdx+rdx*4]
add rsi, rsi
sub rax, rsi
add eax, 48
mov BYTE [rcx], al
mov rax, rdi
mov rdi, rdx
mov rdx, rcx
sub rcx, 1
cmp rax, 9
ja  .dump_loop
lea rax, [rsp+32]
mov edi, 1
sub rdx, rax
lea rsi, [rsp+32+rdx]
mov rdx, r8
call print
add  rsp, 40
ret`;

    public constructor(
        protected lexer: Lexer<AlchemySource, Instruction[]>,
        protected pruner: InstructionsPruner,
        protected cross_referencer: CrossReferencer,
    ) { }

    public compile(source: AlchemySource): CompilationResult<Instruction[], string> {
        Logger.debug(`Compiling AMD64 assembly from ${source.text.length} bytes`);
        const instructions = this.lexer.lex(source);
        const pruned_instructions = this.pruner.prune(instructions);
        const cross_referenced_instructions = this.cross_referencer.cross_reference_instructions(pruned_instructions);
        const instructions_source = cross_referenced_instructions
            .map((instruction, index) => instruction.to_asm(index))
            .join("\n");
        const literals_source = cross_referenced_instructions
            .map((instruction, index) => instruction.literal(index))
            .filter(Boolean)
            .join("\n");
        const source_code = `${Amd64AlchemyCompiler.ASM_HEADER}
${instructions_source}
_start:
call usr_main
mov rax, 60
mov rdi, 0
syscall
segment .data
${literals_source}
segment .bss
mem: resb 640000`;
        return {
            source: cross_referenced_instructions,
            output: source_code,
        };
    }
}
