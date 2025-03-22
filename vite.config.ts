import { svelte } from "@sveltejs/vite-plugin-svelte";
// import basicSsl from "@vitejs/plugin-basic-ssl";
import { defineConfig } from "vite";
import ViteRails from "vite-plugin-rails";

export default defineConfig({
  css: {
    preprocessorOptions: {
      scss: {
        api: "modern-compiler",
      },
      sass: {
        silenceDeprecations: ["slash-div"],
      },
    },
  },
  plugins: [ViteRails(), svelte()],
  ssr: {
    noExternal: ["three", "troika-three-text"],
  },
});
