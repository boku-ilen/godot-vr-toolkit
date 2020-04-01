extends Spatial


onready var area = get_node("Area")
onready var finger_tip = get_node("FingerTip")

var current_gui = null


func _ready():
	area.connect("area_entered", self, "_on_touching")
	area.connect("area_exited", self, "_on_left")


func _process(delta):
	if current_gui:
		current_gui.ray_interaction_input(
				finger_tip.global_transform.origin, InputEventMouseMotion, 1)


func _on_touching(body=null):
	if body.get_parent().has_method("ray_interaction_input"):
		current_gui = body.get_parent()
		current_gui.ray_interaction_input(
				finger_tip.global_transform.origin, InputEventMouseButton, 1, true)


func _on_left(body=null):
		current_gui.ray_interaction_input(
				finger_tip.global_transform.origin, InputEventMouseButton, 1, false)