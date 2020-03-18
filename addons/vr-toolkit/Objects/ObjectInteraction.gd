extends "res://addons/vr-toolkit/ARVRControllerExtension.gd"

# https://docs.godotengine.org/en/latest/classes/class_@globalscope.html#enum-globalscope-joysticklist
export(int) var pick_up_id = 2
export(int) var interact_id = 15

onready var area = get_node("Area")

var current_object: InteractableObject = null


func _process(delta):
	# If we are currently holding an object we will translate it with the controller
	if current_object:
		current_object.global_transform = global_transform


func on_button_released(id: int):
	# If we are no longer holding the object we will call for its dropped method 
	# and set the current_object to null
	if id == pick_up_id:
		if current_object:
			current_object.dropped()
			current_object = null


func on_button_pressed(id: int):
	# If the object we try to pick up is in the group of interactable, we will 
	# set our current_object to this object
	if id == pick_up_id:
		current_object = _try_pick_up_interactable()
	# To prevent errors we will first check if the current object is set and then 
	# call for its interact method
	elif id == interact_id:
		if not current_object == null:
			current_object.interact()


func _try_pick_up_interactable():
	for body in area.get_overlapping_bodies():
		if body.is_in_group("Interactable"):
			body.picked_up(controller)
			return body
