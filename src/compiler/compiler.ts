import { CompilationResult } from "./result";

export interface Compiler<InputType, SourceType, OutputType> {
    compile(instructions: InputType): CompilationResult<SourceType, OutputType>;
}
