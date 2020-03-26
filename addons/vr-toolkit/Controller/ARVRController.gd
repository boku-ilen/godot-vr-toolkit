extends Spatial


export(int, "any", "left", "right") var controller_side


# Called when the node enters the scene tree for the first time.
func _ready():
	_set_id_in_children(self)
	_invoke_properties_for_tools(self)


func _set_id_in_children(node: Node):
	for child in node.get_children():
		_set_id_in_children(child)
		if not child.get("on_hand") == null:
				child.on_hand = controller_side


func _invoke_properties_for_tools(node: Node):
	for child in node.get_children():
		_invoke_properties_for_tools(child)
		if child.get_class() == "ControllerTool":
				child.controller_id = controller_side
				child.origin = get_parent()
