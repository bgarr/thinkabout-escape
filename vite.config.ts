import { svelte } from "@sveltejs/vite-plugin-svelte";
import { defineConfig } from "vite";
import ViteRails from "vite-plugin-rails";

export default defineConfig({
  plugins: [ViteRails(), svelte()],
  ssr: {
    noExternal: ["three", "troika-three-text"],
  },
});
