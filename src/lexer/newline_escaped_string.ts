export class NewlineEscapedString extends String {
    public constructor(buffer: { toString: () => string }) {
        const escaped_string = buffer.toString().trim().replace("\\n", "\n");
        super(escaped_string);
    }
}
