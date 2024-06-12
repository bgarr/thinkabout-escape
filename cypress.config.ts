import { defineConfig } from "cypress";
import { cypressEsbuildPreprocessor } from 'cypress-esbuild-preprocessor/src'
import * as path from 'path';

export default defineConfig({
  e2e: {
    baseUrl: "http://localhost:5002",
    video: false,
    screenshotOnRunFailure: true,
    // setupNodeEvents(on, config) {
    //   on("file:preprocessor", cypressEsbuildPreprocessor({
    //     esbuildOptions: {
    //       // optional tsconfig for typescript support and path mapping (see https://github.com/evanw/esbuild for all options)
    //       tsconfig: path.resolve(__dirname, '../../tsconfig.json'),
    //     },
    //   }))
    // },
  },
});
