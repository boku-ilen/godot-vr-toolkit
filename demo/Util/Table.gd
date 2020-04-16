extends Spatial
tool


onready var pillar = get_node("Pillar")
onready var plate = get_node("Plate")
onready var stick = get_node("Stick")
onready var knob = get_node("Knob")


func on_knob_translation(difference):
	$Pillar.mesh.height += difference.y
	$Pillar.translation.y += difference.y / 2
	$Plate.mesh.top_radius += difference.z
	$Plate.translation.y += difference.y
	$Stick.translation.y += difference.y
	$Stick.mesh.height += difference.z
	$Stick.translation.z += difference.z / 2
