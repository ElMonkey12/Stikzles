extends Area2D

signal X_icon_pressed

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		X_icon_pressed.emit()
