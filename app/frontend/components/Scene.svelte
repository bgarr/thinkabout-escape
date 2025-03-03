<script lang="ts">
  import { T } from "@threlte/core";
  import { Environment } from "@threlte/extras";
  import PrivatePlaneInterior from "./PrivatePlaneInterior.svelte";
  import { type CollisionGroupsBitMask } from "@threlte/rapier";
  import { SheetObject } from "@threlte/theatre";
  import { MeshBasicMaterial } from "three";
  import { types } from "@theatre/core";

  const playerCollisionGroups: CollisionGroupsBitMask = [0];

  const transparentMaterial = new MeshBasicMaterial({
    opacity: 0.5,
    transparent: true,
  });

  const x = types.number(0, { range: [-1.1, 1.1] });
  const y = types.number(0, { range: [-1, 0.75] });
  const z = types.number(0, { range: [-4.25, 1.25] });

  const position = types.compound({
    x,
    y,
    z,
  });

  const pitch = types.number(0, { range: [-Math.PI / 2, Math.PI / 2] });
  const yaw = types.number(0, { range: [-Math.PI, Math.PI] });
  const roll = types.number(0, { range: [-Math.PI / 2, Math.PI / 2] });
  const rotation = types.compound({
    pitch,
    yaw,
    roll,
  });
</script>

<Environment url="/vite-dev/backgrounds/cloudy-sky.hdr" isBackground />

<T.HemisphereLight intensity={0.75} />
<T.DirectionalLight />
<SheetObject key="player" props={{ position, rotation }}>
  {#snippet children({ values })}
    <T.PerspectiveCamera
      makeDefault
      fov={30}
      position={[values.position.x, values.position.y, values.position.z]}
      rotation={[
        values.rotation.pitch,
        values.rotation.yaw,
        values.rotation.roll,
      ]}
    />
  {/snippet}
</SheetObject>
<PrivatePlaneInterior position={[0, 0, -1]} />
