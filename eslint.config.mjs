// @ts-check

import js from "@eslint/js";
import * as tsParser from "@typescript-eslint/parser";
import globals from "globals";

export default [
  js.configs.recommended,
  {
    languageOptions: {
      parserOptions: {
        parser: tsParser,
        project: "./tsconfig.json", // <-- Point to your project's "tsconfig.json" or create a new one.
      },
    },
  },
  {
    files: ["**/*.{ts,tsx}"],
  },
  {
    languageOptions: {
      globals: {
        ...globals.jest,
        window: true,
        document: true,
      },
    },
  },
];
