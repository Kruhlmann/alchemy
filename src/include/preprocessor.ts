import fs from "node:fs";
import path from "node:path";

import { ModuleNotFoundError } from "./module_not_found_error";

export class IncludePreprocessor {
    public constructor(protected default_include_paths: string[]) {}

    // eslint-disable-next-line complexity
    public resolve_includes(source_code: string): string {
        const included_files: string[] = [];
        return (
            source_code
                .split("\n")
                // eslint-disable-next-line complexity
                .map((line: string) => {
                    if (line.startsWith("include")) {
                        const target_module = line.split(" ")[1];
                        const module_path = target_module.replace(/\./g, "/");

                        for (const base_path of this.default_include_paths) {
                            const module_path_candidate = path.join(base_path, module_path);
                            if (
                                fs.existsSync(module_path_candidate) &&
                                fs.lstatSync(module_path_candidate).isDirectory()
                            ) {
                                const files = fs
                                    .readdirSync(module_path_candidate)
                                    .filter((file) => file.endsWith(".tasm"));

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
                            } else if (
                                fs.existsSync(`${module_path_candidate}.tasm`) &&
                                fs.lstatSync(`${module_path_candidate}.tasm`).isFile()
                            ) {
                                if (included_files.includes(`${module_path_candidate}.tasm`)) {
                                    // ignoring file that has already been included
                                    return "";
                                } else {
                                    included_files.push(`${module_path_candidate}.tasm`);
                                    return this.resolve_includes(
                                        fs.readFileSync(`${module_path_candidate}.tasm`).toString(),
                                    );
                                }
                            } else {
                                throw new ModuleNotFoundError(target_module, this.default_include_paths);
                            }
                        }
                    } else {
                        return line.startsWith("include") ? "" : line;
                    }
                })
                .join("\n")
        );
    }
}
