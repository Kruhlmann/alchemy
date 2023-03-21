export class Logger {
    public static debug(message: string): void {
        process.stderr.write(`[DBG] ${message}\n`);
    }

    public static info(message: string): void {
        process.stdout.write(`[INF] ${message}\n`);
    }
}
