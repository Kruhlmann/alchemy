export class Logger {
    public static silent = true;

    public static debug(message: string): void {
        if (Logger.silent) return;
        process.stderr.write(`[DBG] ${message}\n`);
    }

    public static info(message: string): void {
        if (Logger.silent) return;
        process.stdout.write(`[INF] ${message}\n`);
    }
}
