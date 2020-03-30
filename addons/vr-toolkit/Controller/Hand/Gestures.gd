extends Spatial


export(int, "any", "left", "right") var controller_side setget set_controller_side

onready var anim = get_node("HandDefault/AnimationPlayer")
onready var hand = get_node("HandDefault")

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
		for animation in anim.get_animation_list():
			if not animation.begins_with("thumb"):# or not animation.begins_with("point"):
				anim.play(animation)
	elif grabbing:
		pass
	elif thumb_on_ax:
		pass


func set_pointing(is_pointing):
	pointing = is_pointing
	apply_gesture()


func set_grabbing(is_grabbing):
	grabbing = is_grabbing
	apply_gesture()


func set_thumb(thumb_on):
	thumb_on_ax = thumb_on
	apply_gesture()


# If left, mirror scene
func set_controller_side(id):
	yield(self, "ready")
	if id == 1:
		hand.scale.y = -1
