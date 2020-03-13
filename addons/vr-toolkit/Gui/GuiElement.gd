extends Control
class_name VRGuiElement

var active_controller: int = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	connect_mouse_entered(self)


func connect_mouse_entered(node: Control):
	for child in get_children():
		child.connect("mouse_entered", self, "controller_feedback")


func controller_feedback():
	GlobalVRAccess.controller_id_dict[active_controller].rumble = 0.3
	yield(get_tree(), "idle_frame")
	GlobalVRAccess.controller_id_dict[active_controller].rumble = 0.0


func _gui_input(event):
	active_controller = event.device
