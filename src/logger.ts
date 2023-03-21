export class Logger {
    public static debug(message: string): void {
        process.stderr.write(`[DBG] ${message}\n`);
    }
}
