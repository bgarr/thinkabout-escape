<script lang="ts">
  import { Canvas } from "@threlte/core";
  import { Debug, World } from "@threlte/rapier";
  import { Project, Sheet, Studio } from "@threlte/theatre";
  import Scene from "./Scene.svelte";
</script>

<Studio />

<Canvas>
  <World autoStart gravity={[0, 0, 0]}>
    <Debug />
    <Project name="Game">
      <Sheet name="Plane">
        <Scene />
      </Sheet>
    </Project>
  </World>
</Canvas>
