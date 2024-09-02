import { Canvas } from "@react-three/fiber";
import React, { useRef } from "react";
import * as THREE from "three";
import { EightBallProps } from "../entrypoints/application";


export const EightBall = ({ value }: EightBallProps) => {
  const pivotRef = useRef<THREE.Mesh>(null);
  const compassTexture = new THREE.TextureLoader().load( '/rotation_guide.png' );

  let uniforms = {
    "compassTexture": { value: compassTexture },
  }
  
  function vertexShader() {
    return `
      varying vec3 vNormal;

      void main() {

          vNormal = normal;

          gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

      }
    `
  }

  const compassShader = ():string => {
    return `
      uniform sampler2D compassTexture;

      varying vec3 vNormal;

      void main() {

          vec2 uv = normalize( vNormal ).xy * 0.5 + 0.5;

          vec3 color = texture2D( compassTexture, uv ).rgb;
          
          gl_FragColor = vec4( color, 1.0 );

      }
  `
  }

  return (
    <>
    <Canvas>
      <mesh
        ref={ pivotRef }
        position={ new THREE.Vector3(0, 0, -1) }
        scale={ new THREE.Vector3(2, 2, 2) }
        material={ new THREE.ShaderMaterial({ uniforms, vertexShader: vertexShader(), fragmentShader: compassShader() }) }
      >
        <sphereGeometry  />
      </mesh>
    </Canvas>
    </>
  )
}