extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "on_collision")


func on_collision(node):
	print("Collided with: " + node.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
