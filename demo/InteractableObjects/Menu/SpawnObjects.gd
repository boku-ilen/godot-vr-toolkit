extends Spatial


var radius = 0.3
var objects: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	for object in GlobalVRAccess.tool_dict.values():
		var object_scene = load(object[0]).instance()
		objects.append(object_scene)
		add_child(object_scene)


func position_objects():
	var i = 0
	for object in objects:
		var angle = i * PI * 2 / objects.size();
		var pos = Vector3(cos(angle), 0, sin(angle)) * radius
		object.transform.origin = pos
		object.set_sleeping(true)
		i += 1
