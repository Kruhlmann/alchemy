import { Instruction, LiteralInstruction, UnreferencedSubInstruction, MarineInstruction } from "../instruction";
import { Logger } from "../logger";
import { InstructionsPruner } from "./pruner";

export class IncludeInstructionPruner implements InstructionsPruner {
    public prune(instructions: Instruction[]): Instruction[] {
        const subroutine_map: Map<string, { start: number; end: number }> = new Map();
        const total_instructions = instructions.length;
        let i = 0;

        while (i < total_instructions) {
            if (instructions[i] instanceof UnreferencedSubInstruction) {
                if (
                    i + 1 < total_instructions &&
                    instructions[i + 1] instanceof LiteralInstruction
                ) {
                    const sub_name = (instructions[i + 1] as LiteralInstruction).read_argument();
                    const start = i;

                    let end = total_instructions - 1;
                    for (let j = i + 2; j < total_instructions; j++) {
                        if (instructions[j] instanceof MarineInstruction) {
                            end = j;
                            break;
                        }
                    }

                    subroutine_map.set(sub_name, { start, end });
                    Logger.debug(`Subroutine '${sub_name}' found from index ${start} to ${end}`);

                    i = end + 1;
                    continue;
                } else {
                    throw new Error(
                        `Invalid subroutine definition starting at index ${i}`
                    );
                }
            } else {
                i++;
            }
        }

        const all_subroutine_names = new Set(subroutine_map.keys());

        const reachable_subroutines = new Set<string>();
        if (!subroutine_map.has("main")) {
            Logger.error("No main function found");
            throw new Error("No main function found");
        }

        this.collect_reachable_subroutines(
            "main",
            reachable_subroutines,
            subroutine_map,
            instructions,
            all_subroutine_names
        );

        const pruned_instructions: Instruction[] = [];
        i = 0;

        while (i < total_instructions) {
            if (instructions[i] instanceof UnreferencedSubInstruction) {
                if (
                    i + 1 < total_instructions &&
                    instructions[i + 1] instanceof LiteralInstruction
                ) {
                    const sub_name = (instructions[i + 1] as LiteralInstruction).read_argument();

                    if (reachable_subroutines.has(sub_name)) {
                        const sub_info = subroutine_map.get(sub_name)!;
                        for (let j = sub_info.start; j <= sub_info.end; j++) {
                            pruned_instructions.push(instructions[j]);
                        }
                        i = sub_info.end + 1;
                        continue;
                    } else {
                        Logger.debug(`Pruning unreachable subroutine '${sub_name}'`);
                        const sub_info = subroutine_map.get(sub_name)!;
                        i = sub_info.end + 1;
                        continue;
                    }
                } else {
                    pruned_instructions.push(instructions[i]);
                    i++;
                }
            } else {
                pruned_instructions.push(instructions[i]);
                i++;
            }
        }

        return pruned_instructions;
    }

    protected collect_reachable_subroutines(
        current_sub_name: string,
        visited: Set<string>,
        subroutine_map: Map<string, { start: number; end: number }>,
        instructions: Instruction[],
        all_subroutine_names: Set<string>,
    ): void {
        if (visited.has(current_sub_name)) {
            return;
        }
        visited.add(current_sub_name);

        const sub_info = subroutine_map.get(current_sub_name);
        if (!sub_info) {
            throw new Error(`Subroutine '${current_sub_name}' is called but not defined`);
        }

        for (let idx = sub_info.start + 2; idx <= sub_info.end; idx++) {
            if (
                instructions[idx] instanceof LiteralInstruction &&
                !(
                    idx - 1 >= 0 &&
                    instructions[idx - 1] instanceof UnreferencedSubInstruction
                )
            ) {
                const literal_arg = (instructions[idx] as LiteralInstruction).read_argument();
                if (all_subroutine_names.has(literal_arg)) {
                    this.collect_reachable_subroutines(
                        literal_arg,
                        visited,
                        subroutine_map,
                        instructions,
                        all_subroutine_names
                    );
                }
            }
        }
    }
}
