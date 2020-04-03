extends Camera


onready var ray = get_node("RayCast")
onready var mesh = get_node("MeshInstance")


func _input(event):
	if event is InputEventMouseMotion:
		# Direct the mouse position on the screen along the camera
		# We use a local ray since it should be relative to the rotation of any parent node
		var mouse_point_vector = project_local_ray_normal(event.position)
		
		# Transform the forward vector to this projected vector (-z is forward)
		ray.transform.basis.z = -mouse_point_vector
	elif event is InputEventMouseButton:
		if event.pressed:
			mesh.global_transform.origin = ray.get_collision_point()
	
