extends "res://addons/godot-openvr/scenes/ovr_main.gd"

#
# This script sets up the VR player, as described in
# https://github.com/GodotVR/godot-openvr-asset.
#

export(PackedScene) var vr_menu
export(PackedScene) var objects_menu

onready var controller1 = get_node("Left")
onready var controller2 = get_node("Right")

var interface


func _ready():
	GlobalVRAccess.controller_id_dict[controller1.controller_id] = controller1
	GlobalVRAccess.controller_id_dict[controller2.controller_id] = controller2


func init_vr_menu():
	var vr_menu_mesh = preload("res://addons/vr-toolkit/Gui/GuiToCurved.tscn").instance()
	vr_menu_mesh.viewport_element = vr_menu
	vr_menu_mesh.rotation_degrees.x = 90
	vr_menu_mesh.visible = false
	add_child(vr_menu_mesh)
	GlobalVRAccess.vr_menus.append(vr_menu_mesh)


func init_object_menu():
	var instance = objects_menu.instance()
	GlobalVRAccess.object_menu = instance
	instance.visible = false
	add_child(instance)
