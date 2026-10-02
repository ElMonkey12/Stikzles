extends RigidBody2D

const randy_the_slime := preload("res://slime_1.tscn")
const hemptwopoioh := preload("res://hemp.tscn")
const sticky := preload("res://stick.tscn")
const flaming_hot := preload("res://campfire.tscn")
const red_fire := preload("res://fire.png")
const blue_fire := preload("res://blue campfire.png")
const gold_slime := preload("res://Gold_slime.png")
const purple_slime := preload("res://Purple_slime_1.png")
const green_slime := preload("res://slime_sprite.png")
const book_menu := preload("res://book_menu.tscn")
const X_icon :=preload("res://X_icon.tscn")
@onready var book_icon = get_node("Book icon")
var Item_count :int= 0
var book_menu_instantiated = book_menu.instantiate()
var X_icon_instatiated = X_icon.instantiate()
var collected_items :Array= []

func _on_book_pressed():
	print("book pressed")
	remove_child(book_icon)
	add_child(X_icon_instatiated)
	book_menu_instantiated.find_child("Sprite2D").show()
	book_menu_instantiated.z_index = 2
	X_icon_instatiated.z_index = 2
	X_icon_instatiated.X_icon_pressed.connect(_on_x_icon_pressed)
	for x in collected_items:
		book_menu_instantiated.find_child(x).show()

func _on_x_icon_pressed():
	add_child(book_icon)
	book_menu_instantiated.find_child("Sprite2D").hide()
	remove_child(X_icon_instatiated)
	for x in collected_items:
		book_menu_instantiated.find_child(x).hide()

func spawn_slime():
	var slime_copy = randy_the_slime.instantiate()
	add_child(slime_copy)
	slime_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	var color_rand = (randi()%10)
	if color_rand < 1:
		slime_copy.find_child("Sprite2D").texture = gold_slime
		slime_copy.name = "gold_slime"
	if color_rand > 0 and color_rand < 4:
		slime_copy.find_child("Sprite2D").texture = purple_slime
		slime_copy.name = "purple_slime"
	if color_rand > 3:
		slime_copy.name = "green_slime"
	var filipe_the_slime = (randi()%2)
	slime_copy.find_child("Sprite2D").flip_h = (filipe_the_slime == 0)
	print("Do a flip, ",filipe_the_slime)
	print(slime_copy.name)
	Item_count += 1
	slime_copy.green_slime_clicked.connect(_on_green_slime_clicked)
	slime_copy.purple_slime_clicked.connect(_on_purple_slime_clicked)
	slime_copy.gold_slime_clicked.connect(_on_gold_slime_clicked)
	await get_tree().create_timer(randi_range(30,40)).timeout
	remove_child(slime_copy)
	Item_count -= 1

func litterallywatchinggrassgrow():
	var hemp_copy = hemptwopoioh.instantiate()
	add_child(hemp_copy)
	hemp_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	hemp_copy.name = "hemp"
	Item_count += 1
	hemp_copy.hemp_clicked.connect(_on_hemp_clicked)
	await get_tree().create_timer(randi_range(30,40)).timeout
	remove_child(hemp_copy)
	Item_count -= 1

func brownandsticky():
	var stick_copy = sticky.instantiate()
	add_child(stick_copy)
	stick_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	stick_copy.name = "stick"
	Item_count += 1
	stick_copy.stick_clicked.connect(_on_stick_clicked)
	await get_tree().create_timer(randi_range(30,40)).timeout
	remove_child(stick_copy)
	Item_count -= +1

func kindling():
	var campfire_copy = flaming_hot.instantiate()
	add_child(campfire_copy)
	campfire_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	var fire_rand = (randi()%5)
	if fire_rand < 2:
		campfire_copy.find_child("Sprite2D").texture = blue_fire
		campfire_copy.name = "blue_campfire"
	else:
		campfire_copy.name = "red_campfire"
	print(campfire_copy.name)
	Item_count += 1
	campfire_copy.red_campfire_clicked.connect(_on_red_campfire_clicked)
	campfire_copy.blue_campfire_clicked.connect(_on_blue_campfire_clicked)
	await get_tree().create_timer(randi_range(30,40)).timeout
	remove_child(campfire_copy)
	Item_count -= 1

func _on_green_slime_clicked():
	if "green_slime" not in collected_items:
		collected_items.append("green_slime")
	print(collected_items)

func _on_purple_slime_clicked():
	if "purple_slime" not in collected_items:
		collected_items.append("purple_slime")
	print(collected_items)

func _on_gold_slime_clicked():
	if "gold_slime" not in collected_items:
		collected_items.append("gold_slime")
	print(collected_items)

func _on_hemp_clicked():
	if "hemp" not in collected_items:
		collected_items.append("hemp")
	print(collected_items)

func _on_stick_clicked():
	if "stick" not in collected_items:
		collected_items.append("stick")
	print(collected_items)

func _on_red_campfire_clicked():
	if "red_campfire" not in collected_items:
		collected_items.append("red_campfire")
	print(collected_items)

func _on_blue_campfire_clicked():
	if "blue_campfire" not in collected_items:
		collected_items.append("blue_campfire")
	print(collected_items)


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(book_menu_instantiated)
	for x in book_menu_instantiated.get_children():
		x.hide()
	litterallywatchinggrassgrow()
	brownandsticky()
	spawn_slime()
	kindling()
	push_error(self.name)
	while true:
		await get_tree().create_timer(randi_range(2,20)).timeout
		if Item_count < 13:
			spawn_slime()
			litterallywatchinggrassgrow()
			brownandsticky()
			kindling()

	
