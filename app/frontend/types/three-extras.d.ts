declare module 'three/examples/jsm/loaders/DRACOLoader.js' {
  import { LoadingManager, Loader, BufferGeometry } from 'three';

  export class DRACOLoader extends Loader {
    constructor(manager?: LoadingManager);
    setDecoderPath(path: string): this;
    setDecoderConfig(config: object): this;
    setWorkerLimit(workerLimit: number): this;
    load(
      url: string,
      onLoad: (geometry: BufferGeometry) => void,
      onProgress?: (event: ProgressEvent) => void,
      onError?: (event: ErrorEvent) => void
    ): void;
    parse(
      data: ArrayBuffer,
      onLoad: (geometry: BufferGeometry) => void,
      path?: string
    ): void;
    dispose(): void;
  }
}