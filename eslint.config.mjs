// @ts-check

import eslint from "@eslint/js";
import tseslint from "typescript-eslint";

export default tseslint.config(
  eslint.configs.recommended,
  tseslint.configs.eslintRecommended,
  {
    ignores: [
      ".yarn/",
      "tsconfig.json",
      "app/frontend/draco",
      "app/frontend/models",
      "app/frontend/active_admin",
      "app/frontend/rails-ujs.esm.js",
      "public/",
      "**/*.d.ts",
    ],
  }
);
