// Import the TypeScript ESLint plugin which provides TypeScript-specific linting rules
import typescriptEslint from "@typescript-eslint/eslint-plugin";
// Import the TypeScript parser that allows ESLint to understand TypeScript syntax
import tsParser from "@typescript-eslint/parser";

// Export the ESLint configuration as an array of configuration objects
export default [{
    // Specify which files this configuration applies to - in this case, all TypeScript files
    files: ["**/*.ts"],
}, {
    // Define the plugins being used in this configuration
    plugins: {
        // Register the TypeScript ESLint plugin under the "@typescript-eslint" namespace
        "@typescript-eslint": typescriptEslint,
    },

    // Configure the language options for parsing
    languageOptions: {
        // Use the TypeScript parser for processing files
        parser: tsParser,
        // Specify ECMAScript 2022 as the JavaScript version to support
        ecmaVersion: 2022,
        // Treat files as ES modules
        sourceType: "module",
    },

    // Define the linting rules
    rules: {
        // Enforce consistent naming conventions for imports
        "@typescript-eslint/naming-convention": ["warn", {
            selector: "import",
            // Allow both camelCase and PascalCase for imports
            format: ["camelCase", "PascalCase"],
        }],

        // Enforce the use of curly braces around blocks (warning level)
        curly: "warn",
        // Enforce the use of === and !== over == and != (warning level)
        eqeqeq: "warn",
        // Disallow throwing literals as exceptions (warning level)
        "no-throw-literal": "warn",
        // Enforce the use of semicolons (warning level)
        semi: "warn",
    },
}];
