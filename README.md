# Reconstruction of heart activities in 3D geometry

A novel low-rank and joint-sparse decomposition (LJSD) is developed for effective reconstruction of epicardial electrical potential.
Ensemble Empirical Mode Decomposition algorithm (EEMD) with a You-Only-Look-Once (YOLO) image-recognition architecture is applied for heart diseasr detection


## Simulation on synthetic data
- (a) Geometric 3D representation of the concentric spheres; 
- (b) Discretization of the surfaces with 242 nodes and 480 triangular elements
![ssynthetic 3d grid](https://user-images.githubusercontent.com/71365210/189989168-6932687e-7461-403b-a1cf-0fc9a02708cc.jpg)

- Visualize the potential on the inner surface 
![simulation results](https://user-images.githubusercontent.com/71365210/189988480-e6a2f719-5d3b-4317-904f-f59f5ac408d2.jpg)

## Experiments on realistic data
- Realistic 3D heart-torso geometry
![realistic geometry](https://user-images.githubusercontent.com/71365210/189990123-14b2da7e-f553-45d0-9080-057f3ee7b4c2.jpg)

- (a) three views of 192 electrodes matrix covering torso surface
- (b) electrical potentials on the body surface
- (c) reconstructed electrical potentials on the heart surface
![heart result](https://user-images.githubusercontent.com/71365210/189990333-2af4748a-f9d5-4ff0-99ca-8c69778926a5.jpg)

- Comparison of epicardial potential reconstruction using propose low-rank and joint-sparse decomposition (LJSD) and the other three regularization algorithms is showcased
![reuslts](https://user-images.githubusercontent.com/71365210/189991153-5983f64a-4b90-42d7-85a8-232c8d0f3711.jpg)


## Using this prototype
1. Android Studio Required
  - ext.kotlin_version = '1.3.60'
  - com.android.tools.build:gradle:3.5.2
  - com.google.ar.sceneform:plugin:1.15.0'
2. Install Emulator (using Pixel 3 API 27)
  - Start Pixel 3 Emulator-> Extended Controls-> Setting-> OpenGL ES API Level -> Rendered Maximum



## License
Copyright 2020 

