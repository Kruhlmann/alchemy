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

    public static warn(message: string): void {
        if (Logger.silent) return;
        process.stdout.write(`[WAR] ${message}\n`);
    }

    public static error(message: string): void {
        process.stdout.write(`[ERR] ${message}\n`);
    }
}
