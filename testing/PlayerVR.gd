extends "res://addons/godot-openvr/scenes/ovr_main.gd"

#
# This script sets up the VR player, as described in
# https://github.com/GodotVR/godot-openvr-asset.
#

export(PackedScene) var vr_menu
export(PackedScene) var objects_menu

onready var controller_left = get_node("LeftVisual")
onready var controller_right = get_node("RightVisual")

var interface


func _ready():
	GlobalVRAccess.controller_id_dict[controller_left.controller_id] = controller_left
	GlobalVRAccess.controller_id_dict[controller_right.controller_id] = controller_right


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
