import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    baseUrl: "http://localhost:5002",
    video: false,
    screenshotOnRunFailure: true,
  },
});
