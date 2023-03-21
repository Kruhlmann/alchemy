export class LineBuffer {
    protected buffer: string;
    protected column: number;

    public constructor() {
        this.reset();
    }

    public push(char: string): void {
        this.buffer += char;
    }

    public empty(): boolean {
        return this.buffer.trim().length === 0;
    }

    public toString(): string {
        return this.buffer;
    }

    public set_buffer_content(content: string): void {
        this.buffer = content;
    }

    public reset(): void {
        this.buffer = "";
        this.column = -1;
    }

    public set_col(column: number): void {
        this.column = column;
    }

    public get_col(): number {
        return this.column;
    }

    public dup(): LineBuffer {
        const symbolBuffer = new LineBuffer();
        symbolBuffer.set_col(this.column);
        symbolBuffer.set_buffer_content(this.buffer);
        return symbolBuffer;
    }
}
