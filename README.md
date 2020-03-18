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

* Download the addons folder and include it in your project. Note that you also need the ``godot-openvr``-directory. All credits go to Bastiaan Olij.
* Additionally if you want to use anything of the sample scene, also copy the scripts/scenes you wish to use.
* Go to ``Project > Project Settings... > Autoload`` and search for the script ``res://addons/vr-toolkit/GlobalVRAccess.gd``. This creates a singleton which can be accessed from anywhere in the code, I sadly could not find a workaround for some features.
* Go to ``Project > Project Settings... > Plugins`` and set the ``ARVRControllerExtension`` to active.
* Also make sure that in ``Project > Project Settings... > GDNative`` godot_openvr is enabled.

https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html

## Features

* VR-Locomotion using a efficent way for intuitive teleportation

![RayTeleport](https://user-images.githubusercontent.com/33001106/76965131-15944880-6924-11ea-970f-447f7383ea2a.png)
* Object-Interaction System
  * A superclass that is base on a rigidbody and can be extended, like described in the tutorial of https://github.com/GodotVR/godot_openvr_fps
  * A compass, a simple ball, aswell as a pew-pew-gun system are currently implemented to show the usage of this system, more will follow
  * It is possible to throw the objects in the direction of the controller-motion
  
![ObjectInteraction](https://user-images.githubusercontent.com/33001106/76966569-77ee4880-6926-11ea-973c-1c45087b002e.png)
* Easily render a viewport on a plane (in the future probably also more complex shape) so you can create user interfaces
  * This includes rendering of UI-Scenes aswell as cameras
  * The project has two testing scenes for this (UI and a camera)
* VR-Controller UI Interaction
  * Like in common VR-projects and menus, a RayCast is sent from the controller which collides with a viewport on a mesh
  * With a faked ``InputEventMouse`` interaction with those viewports can be "faked": [InputEventMouse](https://docs.godotengine.org/en/stable/classes/class_inputeventmouse.html)
  * Vibration in the controller on hovering UI-elements
  
![GuiInteraction](https://user-images.githubusercontent.com/33001106/76964827-9d2d8780-6923-11ea-9d8b-434124320fa8.png)
  
For more in depth explanation of nodes, scripts and general functionalities check out the [Wiki](https://github.com/boku-ilen/godot-vr-toolkit/wiki).

## Notes

Please note that (sadly) i do not have tested these scripts / behaviours on any other devices than the Rift Oculus. I will be able to test on the Valve Index soon, keep in contact if anything does not properly work on other devices.

## Contributing

Help is greatly appreciated! You can check out known [issues](https://github.com/boku-ilen/godot-vr-toolkit/issues) or submit new functionality and bugs/errors, as well as enhancements.
