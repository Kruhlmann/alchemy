import { TasmLexer, UnknownInstructionError } from "../src";

describe("TasmLexer", () => {
    it("throws UnknownInstructionError on unknown instruction", () => {
        const lexer = new TasmLexer();
        const error_callback = () =>
            lexer.lex({
                text: "invalid_instruction_name",
                context: "UnknownInstructionError test",
            });
        expect(error_callback).toThrow(UnknownInstructionError);
    });
});
