# Godot VR Toolkit

A few useful nodes that should ease implementing VR in Godot. UI, Teleport and other useful tools.
Big shout outs to the creators/projects:

* [Bastiaan Olij](https://github.com/BastiaanOlij) for giving us the possibility to use VR in godot at all:
  https://github.com/GodotVR/godot_openvr
* [TwistedTwigleg](https://github.com/TwistedTwigleg) for an overview on how to use VR in godot:
  https://github.com/GodotVR/godot_openvr_fps
* [Aaron Franke](https://github.com/aaronfranke) for giving me an inspiration on how to use input from a 3D-World on a Mesh: 
  https://github.com/godotengine/godot-demo-projects/tree/3.1-342f27e/viewport/gui_in_3d

## Install and Usage

https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html

## Features

* VR-Locomotion using a efficent way for intuitive teleportation
* Object-Interaction System
  * A superclass that is base on a rigidbody and can be extended
  * A compass, a simple ball, aswell as a pew-pew-gun system are currently implemented to show the usage of this system
  * It is possible to throw the objects in the direction of the controller-motion
* Easily render a viewport on a plane (in the future probably also more complex shape) so you can create user interfaces
  * This includes rendering of UI-Scenes aswell as cameras
  * The project has two testing scenes for this (UI and a camera)
* VR-Controller UI Interaction
  * Like in common VR-projects and menus, a RayCast is sent from the controller which collides with a viewport on a mesh

