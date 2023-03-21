import { Amd64Compiler } from "../src/compiler/amd64";

let compiler: Amd64Compiler;

describe("Amd64Compiler", () => {
    beforeEach(() => {
        compiler = new Amd64Compiler();
    });

    it("compiles a simple program", () => {
        compiler.compile([]);
    });
});
