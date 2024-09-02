import { Canvas, useFrame } from "@react-three/fiber";
import { Leva, LevaPanel, useControls, useCreateStore } from "leva";
import { createPlugin, LevaInputProps } from 'leva/plugin';
import React, { createRef, StrictMode, useEffect, useLayoutEffect, useRef } from "react";
import ReactDOM from "react-dom/client";
import * as THREE from "three";
import { EightBall } from "../controls/EightBall";
import { PrivateJet } from "../private_jet/PrivateJet";
import { Data, StoreType } from "leva/src/types";
import { OrientatedCamera } from "../controls/OrientatedCamera";

type EightBallControlInput = THREE.Quaternion & { input: THREE.Euler }
type EightBallControlProps = LevaInputProps<THREE.Quaternion, EightBallControlInput, JSX.Element>


// essentially no-ops. We don't need to do anything to the value
const normalize = (input: THREE.Euler, path: string, data: Data) => ({ value: input, settings: undefined })
const sanitize = (value: any, settings: {}, prevValue: any, path: string, store: StoreType) => value;
const format = (v: THREE.Quaternion) => v

export const eightBall = createPlugin<THREE.Euler, THREE.Euler, EightBallControlProps>({
  normalize,
  sanitize,
  format,
  component: EightBall,
})


export const App = () => {
  const cameraRef = useRef<THREE.PerspectiveCamera>(null);
  const store = useCreateStore();

  const setCameraPosition = (value: any) => {
    if (!cameraRef.current) return;

    cameraRef.current.position.x += value.truckStick;
    cameraRef.current.position.z += value.dollyStick;

    return true;
  }

  const panTiltCamera = (value: any) => {
    if (!cameraRef.current) return;

    // Define the angles of rotation in radians
    const panAngle = value.panStick % Math.PI / 2; // Rotation around the y-axis
    const tiltAngle = value.tiltStick % Math.PI / 2; // Rotation around the x-axis

    const qy = new THREE.Quaternion();
    const yAxis = new THREE.Vector3(0, 1, 0);
    qy.setFromAxisAngle(yAxis, panAngle);

    const qx = new THREE.Quaternion();
    const xAxis = new THREE.Vector3(1, 0, 0);
    qx.setFromAxisAngle(xAxis, -tiltAngle);

    // Combine the quaternions
    const combinedQuaternion = new THREE.Quaternion();
    combinedQuaternion.multiplyQuaternions(qx, qy);

    // Apply the resulting quaternion to the camera
    // cameraRef.current.rotation.setFromQuaternion(new THREE.Quaternion());
    cameraRef.current.quaternion.set(combinedQuaternion.x, combinedQuaternion.y, combinedQuaternion.z, combinedQuaternion.w);
    

    // set({ ...values, 'orientation': eightBall({ value: { cameraPan: cameraRef.current.rotation.x, cameraTilt: cameraRef.current.rotation.y }})});

    // cameraRef.current.rotation.y = Math.max(Math.min(cameraRef.current.rotation.y + value.panStick / 10, 2 * Math.PI), 0);
    // if (cameraRef.current.rotation.y === 2 * Math.PI) cameraRef.current.rotation.y = 0;

    // cameraRef.current.rotation.z = Math.max(Math.min(cameraRef.current.rotation.z + value.tiltStick / 10, 2 * Math.PI), 0);
    // if (cameraRef.current.rotation.z === 2 * Math.PI) cameraRef.current.rotation.z = 0;
    // const euler = cameraRef.current.rotation;
    // euler.y = Math.max(Math.min(euler.y + value.panStick / 10, Math.PI), 0);
    // cameraRef.current.setRotationFromEuler(euler);
    // euler.x += value.tiltStick;
    // cameraRef.current.setRotationFromEuler(euler);

    return true;
  }

  const rollCamera = (value: any) => {
    if (!cameraRef.current) return;

    const qz = new THREE.Quaternion();
    const zAxis = new THREE.Vector3(0, 0, 1);
    qz.setFromAxisAngle(zAxis, value);

    cameraRef.current.rotation.setFromQuaternion(new THREE.Quaternion());
    cameraRef.current.quaternion.multiply(qz);

    // cameraRef.current.rotation.z += value;

    return true;
  }

  const [values, set] = useControls(():any => {
    return {
    "truck/dolly": { value: { truckStick: 0, dollyStick: 0 }, onChange: setCameraPosition },
    "pan/tilt": { value: { panStick: 0, tiltStick: 0 }, min: -Math.PI, max: Math.PI, onChange: panTiltCamera },
    roll: { value: 0, min: -0.0125, max: 0.0125, onChange: rollCamera },
    orientation: eightBall(),
  }
}, { store });

  // const omitFunctions = (object: any) => omit(object, functions(object));

  
  return (
    <StrictMode>
      <h1>Plan My Escape!</h1>
      <Leva />
      <LevaPanel
        store={store}
        titleBar={{ title: "Settings", drag: true, filter: false, position: { x: -500, y: 0 } }}
      />
      <div style={{ display: "flex", flexDirection: "row", justifyContent: "center", marginRight: "400px" }}>
        <Canvas style={{ width: 800, height: 400 }}>
          <PrivateJet children={ undefined } />
          <OrientatedCamera cameraRef={cameraRef} set={set} />
        </Canvas>
      </div>
    </StrictMode>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  const root = ReactDOM.createRoot(
    document.getElementById("root") as HTMLElement
  );

  root.render(<App/>);
}, false);