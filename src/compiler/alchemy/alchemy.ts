import { Instruction } from "../../instruction";
import { AlchemySource } from "../../lexer";
import { Compiler } from "../compiler";

export type AlchemyCompiler = Compiler<AlchemySource, Instruction[], string>;
