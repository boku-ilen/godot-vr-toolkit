extends TextureButton


var my_object


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_button_toggle(toggled: bool):
	my_object.visible = !my_object.visible
	if toggled:
		pass
