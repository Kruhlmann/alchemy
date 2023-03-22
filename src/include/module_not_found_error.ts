export class ModuleNotFoundError extends Error {
    public name = "ModuleNotFoundError";

    public constructor(module_name: string, search_locations: string[]) {
        const search_locations_string = search_locations.join(", ");
        super(`Module '${module_name}' not found in [${search_locations_string}]`);
    }
}
