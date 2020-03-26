extends "res://addons/vr-toolkit/Controller/ControllerTool.gd"

export(float) var ray_length = 100
export(SpatialMaterial) var visualizer_material = SpatialMaterial.new()
export(float) var point_radius = 0.04
export(bool) var enabled = true

onready var interact_ray: RayCast = get_node("RayCast")
onready var line_visualizer = get_node("ImmediateGeometry")
onready var point_visualizer = get_node("Node/MeshInstance")
onready var menu_input = get_node("Inputs/MenuInput")
onready var interact_input = get_node("Inputs/InteractInput")

var direction: Vector3

func _ready():
	menu_input.connect("pressed", self, "toggle_menu", [true])
	menu_input.connect("released", self, "toggle_menu", [false])
	interact_input.connect("pressed", self, "interact", [true])
	interact_input.connect("released", self, "interact", [false])
	
	line_visualizer.set_material_override(visualizer_material)
	
	point_visualizer.set_material_override(visualizer_material)
	point_visualizer.mesh.radius = point_radius
	point_visualizer.mesh.height = point_radius * 2
	
	interact_ray.set_cast_to(-(transform.basis.z) * ray_length)
	
	direction = -(transform.basis.z) * ray_length
	draw_line(global_transform.origin, direction)


func _process(delta):
	# Logic + visualization is only active if enabled
	if enabled:
		show()
		if interact_ray.is_colliding():
			# The point should not be visible if anything other than a UI-Element is hit, thus
			# I made the ray so it only collides with the specific collision mask of VRGui
			point_visualizer.set_visible(true)
			point_visualizer.global_transform.origin = interact_ray.get_collision_point()
			
			# The line should end where the ray collides - thus we find the 
			# distance from the start point colliding point and with it we multiply forward
			var colliding_distance = global_transform.origin.distance_to(interact_ray.get_collision_point())
			draw_line(translation, direction.normalized() * colliding_distance)
			# Call the function which managed the input on the viewport in ViewportToMesh.gd
			#TODO REMOVE HARDCODE
			interact_ray.get_collider().get_parent().ray_interaction_input(
				interact_ray.get_collision_point(), InputEventMouseMotion, controller_id)
		else:
			# Not colliding -> no point and longer ray
			point_visualizer.set_visible(false)
			draw_line(translation, direction)
	else:
		hide()


func draw_line(var begin: Vector3, var end: Vector3):
	line_visualizer.clear()
	line_visualizer.begin(Mesh.PRIMITIVE_LINES)
	line_visualizer.add_vertex(begin)
	line_visualizer.add_vertex(end)
	line_visualizer.end()


func toggle_menu(pressed: bool):
	if pressed:
		_toggle_objects()


func interact(pressed: bool):
	if enabled:
		if pressed:
			if not interact_ray.get_collider() == null:
					# Call the function which managed the input on the viewport in ViewportToMesh.gd
					interact_ray.get_collider().get_parent().ray_interaction_input(
						interact_ray.get_collision_point(), InputEventMouseButton, controller_id, true)
		else:
			if not interact_ray.get_collider() == null:
				# Call the function which managed the input on the viewport in ViewportToMesh.gd
				interact_ray.get_collider().get_parent().ray_interaction_input(
					interact_ray.get_collision_point(), InputEventMouseButton,  controller_id, false)


func _toggle_menu():
	var offset = Vector3.ZERO
	for menu in GlobalVRAccess.vr_menus:
		if not menu.visible:
			menu.visible = true
			menu.get_node("Area/CollisionShape").disabled = false
			menu.global_transform.origin = origin.global_transform.origin + -(origin.global_transform.basis.z) + offset
			offset += offset + Vector3.RIGHT
		else:
			# Set the visibility to false and disable the collision-shape so the
			# ray does not interact with an invisble object
			menu.visible = false
			menu.get_node("Area/CollisionShape").disabled = true


func _toggle_objects():
	if not GlobalVRAccess.object_menu.visible:
		GlobalVRAccess.object_menu.visible = true
		GlobalVRAccess.object_menu.global_transform.origin = origin.global_transform.origin + -(origin.global_transform.basis.z)
	
	GlobalVRAccess.object_menu.position_objects()
