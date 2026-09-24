extends Area2D
## Attach this script to the Area2D root of any sprite scene
## (slime_1, stick, hemp, ...) to make it pick-up-and-drag-able
## with the left mouse button.
signal slime_clicked
signal stick_clicked
signal hemp_clicked
signal campfire_clicked
var _dragging := false
var _drag_offset := Vector2.ZERO

# Area2D only calls _input_event for clicks that land on THIS node's
# collision shape, so we don't have to track mouse-hover ourselves.
func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		if "slime" in name:
			slime_clicked.emit()
		if "stick" in name:
			stick_clicked.emit()
		if "hemp" in name:
			hemp_clicked.emit()
		if "campfire" in name:
			campfire_clicked.emit()
		_dragging = true
		_drag_offset = global_position - get_global_mouse_position()
		z_index = 1 # draw whatever we're holding above everything else

func _process(_delta: float) -> void:
	if _dragging:
		if Input.is_action_pressed("left_click"):
			global_position = get_global_mouse_position() + _drag_offset
		else:
			_dragging = false
			z_index = 0

 # Keep this node's jiggle animation looping, if it has one (used by slime).

	if has_node("AnimationPlayer"):
		var anim: AnimationPlayer = $AnimationPlayer
		if anim.has_animation("slime_jiggle") and anim.current_animation != "slime_jiggle":
			anim.play("slime_jiggle")
		if anim.has_animation("fire_dance") and anim.current_animation != "fire_dance":
			anim.play("fire_dance")
		if anim.has_animation("hemp_sway") and anim.current_animation != "hemp_sway":
			anim.play("hemp_sway")
