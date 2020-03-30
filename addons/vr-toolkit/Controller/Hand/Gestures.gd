extends Spatial


onready var default_gesture = get_node("Meshes/Pointing")
onready var grabbing_gesture = get_node("Meshes/Grabbing")
onready var pointing_gesture = get_node("Meshes/Default")
#onready var pointing = preload("res://addons/vr-toolkit/Controller/Hand/")

var pointing: bool = false
var grabbing: bool = false
var thumb_on_ax: bool = false


func _ready():
	$Inputs/PointingInput.connect("pressed", self, "set_pointing", [true])
	$Inputs/PointingInput.connect("released", self, "set_pointing", [false])
	$Inputs/GrabbingInput.connect("pressed", self, "set_grabbing", [true])
	$Inputs/GrabbingInput.connect("released", self, "set_grabbing", [false])
	$Inputs/ThumbInput.connect("pressed", self, "set_thumb", [true])
	$Inputs/ThumbInput.connect("released", self, "set_thumb", [false])


func apply_gesture():
	if pointing:
		_hide_gestures()
		pointing_gesture.visible = true
	elif grabbing:
		_hide_gestures()
		grabbing_gesture.visible = true
	elif thumb_on_ax:
		_hide_gestures()
		default_gesture.visible = true


func _hide_gestures():
	for child in get_node("Meshes").get_children():
		child.visible = false


func set_pointing(is_pointing):
	pointing = is_pointing
	apply_gesture()


func set_grabbing(is_grabbing):
	grabbing = is_grabbing
	apply_gesture()


func set_thumb(thumb_on):
	thumb_on_ax = thumb_on
	apply_gesture()
