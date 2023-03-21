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
}
