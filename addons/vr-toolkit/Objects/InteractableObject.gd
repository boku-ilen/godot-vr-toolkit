extends RigidBody
class_name  InteractableObject

onready var original_parent = get_parent()

var controller_id: int
var object_interaction
var _is_picked_up: bool = false
var _is_interacting: bool = false


# Onready add it to the group of interactable, so the ObjectInteraction node can
# checks for it.
func _ready():
	add_to_group("Interactable")


# This method will be called, when the interaction-button is pressed on the current controller
func interact():
	_is_interacting = true


func interact_end():
	_is_interacting = false


# This happens when the pick-up-button is pressed on the current controller
func picked_up(my_controller: int, my_interactor):
	controller_id =  my_controller
	object_interaction = my_interactor
	_is_picked_up = true


# This happens when the pick-up-button is released on the current controller
# Get the current position and wait two physics-frames (so it is not frame dependent)
# then check for the position again. The direction will be the difference of those two positions
func dropped(velocity: Vector3):
	if not object_interaction == null:
		set_linear_velocity(velocity)
	
	controller_id = 0
	object_interaction = null
	_is_picked_up = false
