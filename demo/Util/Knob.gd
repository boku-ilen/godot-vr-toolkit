extends VRStaticInteractable
tool

var translation_before = translation

var controller_translation_before


func _process(delta):
	if is_picked_up:
		var diff = object_interaction.global_transform.origin - controller_translation_before
		translation.y += diff.y
		translation.z += diff.z
		controller_translation_before = object_interaction.global_transform.origin


func pick(my_controller: int, my_interactor):
	.pick(my_controller, my_interactor)
	controller_translation_before = object_interaction.global_transform.origin


func _notification(what):
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		
		get_parent().on_knob_translation(translation - translation_before)
		translation_before = translation
