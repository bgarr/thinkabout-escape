import { svelte } from "@sveltejs/vite-plugin-svelte";
import { defineConfig } from "vite";
import FullReload from "vite-plugin-full-reload";
import RubyPlugin from "vite-plugin-ruby";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(["config/routes.rb", "app/views/**/*"]),
    svelte(),
  ],
  ssr: {
    noExternal: ["three", "troika-three-text"],
  },
});
