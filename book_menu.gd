extends RigidBody2D

signal menu_relay
var collection = []

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().stick_collected.connect(_on_stick_collected)
	get_parent().green_slime_collected.connect(_on_green_slime_collected)
	get_parent().purple_slime_collected.connect(_on_purple_slime_collected)
	get_parent().gold_slime_collected.connect(_on_gold_slime_collected)
	get_parent().hemp_collected.connect(_on_hemp_collected)
	get_parent().campfire_collected.connect(_on_campfire_collected)
	menu_relay.emit()
	print("relay")

func _on_stick_collected():
	print("stick collected")
	collection.append("stick")

func _on_green_slime_collected():
	print("green slime collected")
	collection.append("green_slime")

func _on_purple_slime_collected():
	print("purple slime collected")
	collection.append("purple_slime")

func _on_gold_slime_collected():
	print("gold slime collected")
	collection.append("gold_slime")

func _on_hemp_collected():
	print("hemp collected")
	collection.append("hemp")

func _on_campfire_collected():
	print("campfire collected")
	collection.append("campfire")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
