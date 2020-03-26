extends "res://addons/vr-toolkit/Controller/ControllerTool.gd"


onready var area = get_node("Area")

# The picked up object
var current_object: InteractableObject = null
# The initial transform of the object when picking up
var original_object_transform: Transform = Transform.IDENTITY
var last_position = Vector3(0.0, 0.0, 0.0)
var velocities = Array()


func _ready():
	$Inputs/PickUpInput.connect("pressed", self, "on_pickup", [true])
	$Inputs/PickUpInput.connect("released", self, "on_pickup", [false])
	$Inputs/InteractInput.connect("pressed", self, "on_interact")


func _process(delta):
	# If we are currently holding an object we will translate it with the controller
	if current_object:
		current_object.global_transform.origin = global_transform.origin
		# Apply the rotation since the object has been picked up
		current_object.global_transform.basis = global_transform.basis * original_object_transform.basis
		# Prevent floating point inaccuracy 
		current_object.global_transform = current_object.global_transform.orthonormalized()


func on_interact():
	if not current_object == null:
			current_object.interact()


func on_pickup(pressed: bool):
	# If the object we try to pick up is in the group of interactable, we will 
	# set our current_object to this object
	if pressed:
		current_object = _try_pick_up_closest_interactable()
		if not current_object == null:
			# As sometimes it is practicable to set the rigidbodies to sleeping
			# so they stay in position, disable this now.
			current_object.set_sleeping(false)
			# Save the transform of the object when it was taken, we need this 
			# to accurately compute the transform with the rotation of the controller
			original_object_transform = current_object.global_transform
			# Reset the basis of global_transform to Identity so only the rotation
			# from the moment it has been picked up will be applied, not the rotation
			# that the controller already has when picking up
			global_transform.basis = Basis.IDENTITY
	else:
	# If we are no longer holding the object we will call for its dropped method 
	# and set the current_object to null
		if current_object:
			current_object.dropped()
			current_object = null


func _try_pick_up_closest_interactable():
	var closest_distance = INF
	var closest_body
	
	for body in area.get_overlapping_bodies():
		if body.is_in_group("Interactable"):
			var distance = global_transform.origin.distance_to(body.global_transform.origin)
			if distance < closest_distance:
				closest_distance = distance
				closest_body = body
	
	if not closest_body == null: closest_body.picked_up(controller_id, self)
	return closest_body
