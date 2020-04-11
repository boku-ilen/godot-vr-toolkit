extends "res://addons/godot-openvr/scenes/ovr_main.gd"
#tool

#
# This script sets up the VR player, as described in
# https://github.com/GodotVR/godot-openvr-asset.
#

export(PackedScene) var vr_menu
export(PackedScene) var objects_menu
export(bool) var enable_controller_left setget set_enable_controller_left
export(bool) var enable_controller_right setget set_enable_controller_right
export(bool) var enable_hand_left setget set_enable_hand_left
export(bool) var enable_hand_right setget set_enable_hand_right

onready var controller_left = get_node("LeftVisual")
onready var controller_right = get_node("RightVisual")
onready var hand_left = get_node("Left/Tip/Gestures")
onready var hand_right = get_node("Right/Tip/Gestures")

var interface


func set_enable_controller_left(is_visible):
	enable_controller_left = is_visible
	get_node("LeftVisual").show_controller_mesh = enable_controller_left


func set_enable_controller_right(is_visible):
	enable_controller_right = is_visible
	get_node("RightVisual").show_controller_mesh = enable_controller_right


func set_enable_hand_left(is_visible):
	enable_hand_left = is_visible
	get_node("Left/Tip/Gestures").visible = enable_hand_left


func set_enable_hand_right(is_visible):
	enable_hand_right = is_visible
	get_node("Right/Tip/Gestures").visible = enable_hand_right


func _ready():
	GlobalVRAccess.controller_id_dict[controller_left.controller_id] = controller_left
	GlobalVRAccess.controller_id_dict[controller_right.controller_id] = controller_right
	
#	init_object_menu()
#	init_vr_menu()


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
