extends HBoxContainer


onready var button = get_node("Button")
onready var label = get_node("Label")

# Called when the node enters the scene tree for the first time.
func _ready():
	button.connect("pressed", self, "_pressed")


func _pressed():
	label.text = "Button pressed: " + String(button.pressed)
