import {
    CrossReferencer,
    ReferenceStackEmptyError,
    ReferenceStackNotEmptyError,
    UnexpectedInstructionError,
    UnreferencedElseInstruction,
    UnreferencedIfInstruction,
    UnreferencedWendInstruction,
} from "../src";

describe("CrossReferencer", () => {
    it("throws UnexpectedInstructionError on invalid instruction layout", () => {
        const cross_referencer = new CrossReferencer();
        const error_callback = () =>
            cross_referencer.cross_reference_instructions([
                new UnreferencedIfInstruction(),
                new UnreferencedWendInstruction(),
            ]);
        expect(error_callback).toThrow(UnexpectedInstructionError);
    });
    it("throws ReferenceStackEmptyError on missing instructions", () => {
        const cross_referencer = new CrossReferencer();
        const error_callback = () => cross_referencer.cross_reference_instructions([new UnreferencedElseInstruction()]);
        expect(error_callback).toThrow(ReferenceStackEmptyError);
    });
    it("throws ReferenceStackNotEmptyError on dangling instructions", () => {
        const cross_referencer = new CrossReferencer();
        const error_callback = () => cross_referencer.cross_reference_instructions([new UnreferencedIfInstruction()]);
        expect(error_callback).toThrow(ReferenceStackNotEmptyError);
    });
});
