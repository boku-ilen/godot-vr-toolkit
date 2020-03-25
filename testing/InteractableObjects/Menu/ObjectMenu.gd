extends BoxContainer


onready var object_button = load("res://testing/InteractableObjects/Menu/ObjectButton.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for object in GlobalVRAccess.tool_dict.values():
		var button = object_button.instance()
		var button_texture = button.get_node("Viewport")
		var object_scene = load(object[0]).instance()
		object_scene.set_sleeping(true)
		button_texture.add_child(object_scene)
		object_scene.translation = Vector3(0, 0.01, -1.5)
		add_child(button)
		button.set_toggle_mode(true)
		button.my_object = object_scene
		button.connect("toggled", button, "_on_button_toggle")
