extends RigidBody2D

signal menu_relay

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().stick_collected.connect(_on_stick_collected)
	get_parent().slime_collected.connect(_on_slime_collected)
	get_parent().hemp_collected.connect(_on_hemp_collected)
	get_parent().campfire_collected.connect(_on_campfire_collected)
	menu_relay.emit()
	print("relay")

func _on_stick_collected():
	print("stick collected")

func _on_slime_collected():
	print("slime collected")

func _on_hemp_collected():
	print("hemp collected")

func _on_campfire_collected():
	print("campfire collected")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
