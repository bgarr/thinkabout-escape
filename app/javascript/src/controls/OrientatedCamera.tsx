import React from "react";
import { PerspectiveCamera } from "@react-three/drei";
import * as THREE from "three";
import { isEqual } from "lodash";
import { useFrame } from "@react-three/fiber";

export type OrientatedCameraProps = {
  cameraRef: React.MutableRefObject<THREE.PerspectiveCamera | null>,
  set: (value: any) => void,
}

export const OrientatedCamera = ({ cameraRef, set }: OrientatedCameraProps) => {
  const { x,y,z } = cameraRef.current?.rotation || { x: 0, y: 0, z: 0 };
  let cameraRotation = { x,y,z }

  useFrame(() => {
    if (!cameraRef.current?.rotation) return;

    const { x,y,z } = cameraRef.current.rotation;
    if (isEqual({ x,y,z }, cameraRotation)) return;

    cameraRotation.x = x;
    cameraRotation.y = y;
    // cameraRotation.z = z;
    set({
      orientation: {
        value: { panStick: cameraRef.current.rotation.x, tiltStick: cameraRef.current.rotation.y }
      },
    });
  });

  return (
    <>
      <PerspectiveCamera
          ref={cameraRef}
          far={1000}
          fov={35}
          makeDefault
          near={0.1}
          position={[ 0, 0, 0 ]}
          rotation={[ 0, Math.PI / 2, 0 ]}
        />
    </>
  );
}