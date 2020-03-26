extends RayCast


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var forward = get_parent().get_node("Forward")
onready var base = get_parent().get_node("Base")

# Called when the node enters the scene tree for the first time.
func _ready():
	global_transform.origin = base.global_transform.origin
	set_cast_to(forward.global_transform.origin * 1000) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
