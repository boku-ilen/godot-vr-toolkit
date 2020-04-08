extends Control


var distance setget set_distance, get_distance 
var conversion_factor = 1.0 setget set_conversion


func _ready():
	$VBoxContainer/HBoxContainer/Metres.connect("pressed", self, "set_conversion", [1.0])
	$VBoxContainer/HBoxContainer/Metres.connect("pressed", self, "untoggle", [$VBoxContainer/HBoxContainer/Yards])
	$VBoxContainer/HBoxContainer/Yards.connect("pressed", self, "set_conversion", [0.9144])
	$VBoxContainer/HBoxContainer/Yards.connect("pressed", self, "untoggle", [$VBoxContainer/HBoxContainer/Metres])


func set_distance(distance):
	if distance is float or distance is int and not distance == null:
		$VBoxContainer/Distance.text = String(distance * conversion_factor)
	else:
		$VBoxContainer/Distance.text = "----"


func get_distance():
	return $VBoxContainer/Distance.text.to_int()


func is_pressed(pressed):
	$VBoxContainer/PressedButton.pressed = pressed


func set_conversion(factor: float):
	conversion_factor = factor


func untoggle(node: Node):
	node.pressed = false
