extends Area2D


# Called when the node enters the scene tree for the first time.
func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		get_tree().change_scene_to_file("res://book_menu.tscn")
