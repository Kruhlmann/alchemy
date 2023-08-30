import fs from "node:fs";
import path from "node:path";
import { Logger } from "../logger";

import { ModuleNotFoundError } from "./module_not_found_error";

export class IncludePreprocessor {
    public constructor(protected default_include_paths: string[]) {}

    // eslint-disable-next-line complexity
    public resolve_includes(source_code: string, included_files: string[] = []): string {
        while (source_code.split("\n").some((line) => line.startsWith("include "))) {
            source_code = source_code
                .split("\n")
                // eslint-disable-next-line complexity
                .map((line: string) => {
                    if (!line.startsWith("include")) {
                        return line;
                    }
                    const target_module = line.split(" ")[1];
                    const module_path = target_module.replace(/\./g, "/");

                    for (const base_path of this.default_include_paths) {
                        Logger.debug(`Looking for module ${target_module} in ${base_path}`);
                        const module_path_candidate = path.join(base_path, module_path);
                        const is_directory = fs.existsSync(module_path_candidate)
                            && fs.lstatSync(module_path_candidate).isDirectory();
                        const is_file = fs.existsSync(`${module_path_candidate}.alc`)
                            && fs.lstatSync(`${module_path_candidate}.alc`).isFile();

                        if (is_directory) {
                            return this.include_directory(module_path_candidate, target_module, included_files);
                        }
                        if (is_file) {
                            return this.include_file(included_files, module_path_candidate)
                        }
                    }
                    throw new ModuleNotFoundError(target_module, this.default_include_paths);
                })
                .join("\n");
        }
        return source_code;
    }

    private include_file(included_files: string[], module_path_candidate: string): string {
        if (included_files.includes(`${module_path_candidate}.alc`)) {
            // ignoring file that has already been included
            return "";
        } else {
            included_files.push(`${module_path_candidate}.alc`);
            return this.resolve_includes(
                fs.readFileSync(`${module_path_candidate}.alc`).toString(),
                included_files,
            );
        }
    }

    private include_directory(module_path_candidate: string, target_module: string, included_files: string[]) {
        const files = fs
            .readdirSync(module_path_candidate)
            .filter((file) => file.endsWith(".alc"));

        if (files.length === 0) {
            throw new ModuleNotFoundError(target_module, this.default_include_paths);
        }

        return files
            .map((file) => {
                if (included_files.includes(file)) {
                    // ignoring file that has already been included
                    return "";
                } else {
                    included_files.push(file);
                    return fs.readFileSync(`${module_path_candidate}/${file}`).toString();
                }
            })
            .join("");
    }
}
