<script lang="ts">
  import { T } from '@threlte/core'
  import { AutoColliders } from '@threlte/rapier'
  import type { Vector3 } from 'three';

  export let position: Parameters<Vector3['set']> | undefined = undefined
</script>

<T.Group {position}>
  <AutoColliders shape={'cuboid'}>
    <T.Mesh receiveShadow>
      <T.BoxGeometry args={[20, 1, 20]} />
      <T.MeshStandardMaterial color="blue" />
    </T.Mesh>
  </AutoColliders>
</T.Group>