extends InteractableObject

#
# A compass indicating the orientation of the firstPerson.
# Rotates with the latest global player position from PlayerInfo.
#

onready var compass_symbol = get_node("Spatial")
onready var mesh = get_node("MeshInstance")

var transform_before: Transform = Transform.IDENTITY

func _process(delta):
	if not transform_before == transform:
		var compass_plate_plane = Plane(mesh.global_transform.basis.y, 0)
		
		var new_forward = compass_plate_plane.project(Vector3.FORWARD).normalized()
		var new_up = mesh.global_transform.basis.y
		var new_right = new_forward.cross(new_up)
		
		compass_symbol.global_transform.basis = Basis(new_right, new_up, -new_forward)
	
	transform_before = transform
