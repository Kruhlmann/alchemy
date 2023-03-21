import { Instruction } from "../../instruction";
import { TasmSource } from "../../lexer";
import { Compiler } from "../compiler";

export type TasmCompiler = Compiler<TasmSource, Instruction[], string>;
