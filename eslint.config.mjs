// @ts-check

import js from "@eslint/js";
import * as tsParser from "@typescript-eslint/parser";
import react from "@eslint-react/eslint-plugin";
import reactHooks from "eslint-plugin-react-hooks";

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
    ...react.configs.recommended,
  },
  {
    files: ["**/*.{ts,tsx}"],
    rules: {
      "@eslint-react/no-leaked-conditional-rendering": "error", // <-- Requires type information
    },
  },
  {
    plugins: {
      "react-hooks": reactHooks,
    },

    rules: {
      ...reactHooks.configs.recommended.rules,
    },
  },
  {
    languageOptions: {
      "globals": {
        "window": true,
        "document": true
      },
    }
  },

];