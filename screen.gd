extends RigidBody2D

const randy_the_slime := preload("res://slime_1.tscn")
const hemptwopoioh := preload("res://hemp.tscn")
const sticky := preload("res://stick.tscn")
const flaming_hot := preload("res://campfire.tscn")
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
signal menu_relay_2
signal slime_collected
signal stick_collected
signal hemp_collected
signal campfire_collected

func _on_book_pressed():
	print("book pressed")
	remove_child(book_icon)
	add_child(book_menu_instantiated)
	add_child(X_icon_instatiated)
	book_menu_instantiated.z_index = 2
	X_icon_instatiated.z_index = 2
	X_icon_instatiated.X_icon_pressed.connect(_on_x_icon_pressed)
	book_menu_instantiated.menu_relay.connect(_on_menu_relay)

func _on_menu_relay():
	print(collected_items)
	if "slime" in collected_items:
		slime_collected.emit()
	if "stick" in collected_items:
		stick_collected.emit()
	if "hemp" in collected_items:
		hemp_collected.emit()
	if "campfire" in collected_items:
		campfire_collected.emit()



func _on_x_icon_pressed():
	add_child(book_icon)
	remove_child(book_menu_instantiated)
	remove_child(X_icon_instatiated)

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
	Item_count += -1

func litterallywatchinggrassgrow():
	var hemp_copy = hemptwopoioh.instantiate()
	add_child(hemp_copy)
	hemp_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	hemp_copy.name = "hemp"
	Item_count += 1
	hemp_copy.hemp_clicked.connect(_on_hemp_clicked)
	await get_tree().create_timer(randi_range(30,40)).timeout
	remove_child(hemp_copy)
	Item_count += -1

func brownandsticky():
	var stick_copy = sticky.instantiate()
	add_child(stick_copy)
	stick_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	stick_copy.name = "stick"
	Item_count += 1
	stick_copy.stick_clicked.connect(_on_stick_clicked)
	await get_tree().create_timer(randi_range(30,40)).timeout
	remove_child(stick_copy)
	Item_count += -1

func kindling():
	var campfire_copy = flaming_hot.instantiate()
	add_child(campfire_copy)
	campfire_copy.global_position = global_position + Vector2((randi() % 1150),(randi() % 720))
	campfire_copy.name = "campfire"
	print(campfire_copy.name)
	Item_count += 1
	campfire_copy.campfire_clicked.connect(_on_campfire_clicked)
	await get_tree().create_timer(randi_range(30,40)).timeout
	remove_child(campfire_copy)
	Item_count += -1

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

func _on_campfire_clicked():
	if "campfire" not in collected_items:
		collected_items.append("campfire")
	print(collected_items)


# Called when the node enters the scene tree for the first time.
func _ready():
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

	
