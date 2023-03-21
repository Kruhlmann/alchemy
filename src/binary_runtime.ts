import { spawnSync } from "node:child_process";

import { Logger } from "./logger";

export class BinaryRuntime {
    public constructor(protected binary_path: string, protected binary_arguments: string[] = []) {}

    // eslint-disable-next-line complexity
    public run(): { exit_code: string; stdout: string; stderr: string } {
        const process = spawnSync(this.binary_path, this.binary_arguments);
        Logger.debug("Executed " + [this.binary_path, ...this.binary_arguments].join(" "));
        return {
            exit_code: process.status?.toString() || "-1",
            stdout: process.stdout?.toString().trim() || "",
            stderr: process.stderr?.toString().trim() || "",
        };
    }
}
