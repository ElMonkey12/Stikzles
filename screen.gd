extends RigidBody2D

const randy_the_slime := preload("res://slime_1.tscn")
const hemptwopoioh := preload("res://hemp.tscn")
const sticky := preload("res://stick.tscn")
const flaming_hot := preload("res://campfire.tscn")
const gold_slime := preload("res://Gold_slime.png")
const purple_slime := preload("res://Purple_slime_1.png")
const green_slime := preload("res://slime_sprite.png")
var Item_count : int = 0

func spawn_slime():
	var slime_copy = randy_the_slime.instantiate()
	add_child(slime_copy)
	slime_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	var filipe_the_slime = (randi()%2)
	slime_copy.find_child("Sprite2D").flip_h = (filipe_the_slime == 0)
	print("Do a flip, ",filipe_the_slime)
	slime_copy.name = "slime_1"
	print(slime_copy.name)
	Item_count += 1

func litterallywatchinggrassgrow():
	var hemp_copy = hemptwopoioh.instantiate()
	add_child(hemp_copy)
	hemp_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	hemp_copy.name = "hemp"
	Item_count += 1

func brownandsticky():
	var stick_copy = sticky.instantiate()
	add_child(stick_copy)
	stick_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	stick_copy.name = "stick"
	Item_count += 1

func kindling():
	var campfire_copy = flaming_hot.instantiate()
	add_child(campfire_copy)
	campfire_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	campfire_copy.name = "campfire"
	print(campfire_copy.name)
	Item_count += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	litterallywatchinggrassgrow()
	brownandsticky()
	spawn_slime()
	kindling()
	push_error(self.name)
	while Item_count < 13:
		await get_tree().create_timer(randi() % 20).timeout
		spawn_slime()
		litterallywatchinggrassgrow()
		brownandsticky()
		kindling()
		print(Item_count)


func _on_name_change() -> void:
	pass # Replace with function body.
