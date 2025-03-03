<script lang="ts">
  import { Canvas } from "@threlte/core";
  import { World } from "@threlte/rapier";
  import { Project, Sequence, Sheet, useSequence } from "@threlte/theatre";
  import Scene from "./Scene.svelte";
  import state from "./default.theatre-project-state.json";
</script>

<Canvas>
  <World autoStart gravity={[0, 0, 0]}>
    <Project name="Game" config={{ state }}>
      <Sheet name="Plane">
        <Scene />
        <Sequence />
      </Sheet>
    </Project>
  </World>
</Canvas>
