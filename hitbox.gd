#extends Area2D
#
#var mouse = false
#var drag_offset := Vector2.ZERO
#var stack_level:int
#var z_index_list:Array
#var a_stack_of_things:Array
#var sticker_distance:Vector2
#const rope = preload("res://rope.tscn")
#const hemp = "res://hemp.tscn"
#const firestarter = preload("res://firestarter.tscn")
#const stick = "res://stick.tscn"
#const campfire = preload("res://campfire.tscn")
#var recipe_book:Dictionary = {rope : 2,
 #firestarter : [rope,stick],
 #campfire : [stick,firestarter]}
#var StuffThatIsOverlappingWithOtherStuff:Array
#
##when ready will set z index to 1
#func _ready():
	#z_index = 1
	#
##is the mouse dragging
#func _input_event(_viewport, event, _shape_idx):
	#if Input.is_action_pressed("right_click"):
		##these are for the number of each material
		#var sea_hemp = 0
		#var see_rope = 0
		#var C_stick= 0
		#sea_hemp = 0
		#see_rope = 0
		#
		#for thing in StuffThatIsOverlappingWithOtherStuff:
			#push_error(thing.name)
		#for s in StuffThatIsOverlappingWithOtherStuff:
			#if "hemp" in s.name:
				#sea_hemp += 1
			#if "rope" in s.name:
				#see_rope += 1
			#if "stick" in s.name:
				#C_stick += 1
			#
		#if sea_hemp == 2:
			#push_error("Cooking recipe")
			#var rope_destination = StuffThatIsOverlappingWithOtherStuff[0].global_position
			#rope_destination = StuffThatIsOverlappingWithOtherStuff[0].global_position
			#var rope_copy = rope.instantiate()
			#add_child(rope_copy)
			#push_error("rope created")
			#var parent_node = get_parent()
			#var my_script = load("res://hitbox.gd")
			#rope_copy.reparent(parent_node)
			#rope_copy.set_script(my_script)
			#for x in StuffThatIsOverlappingWithOtherStuff:
				#x.queue_free()
			#for thing in StuffThatIsOverlappingWithOtherStuff:
				#push_error(thing.name)
			#rope_copy.global_position = rope_destination
		#
			#push_error(sea_hemp, see_rope)
		#if sea_hemp == 1 and C_stick == 1:
			#push_error("Cooking recipe")
			#var rope_destination = StuffThatIsOverlappingWithOtherStuff[0].global_position
			#rope_destination = StuffThatIsOverlappingWithOtherStuff[0].global_position
			#var firestarter_copy = firestarter.instantiate()
			#add_child(firestarter_copy)
			#push_error("rope created")
			#var parent_node = get_parent()
			#var my_script = load("res://hitbox.gd")
			#firestarter_copy.reparent(parent_node)
			#firestarter_copy.set_script(my_script)
			#for x in StuffThatIsOverlappingWithOtherStuff:
				#x.queue_free()
			#for thing in StuffThatIsOverlappingWithOtherStuff:
				#push_error(thing.name)
			#firestarter_copy.global_position = rope_destination
		#
			#push_error(sea_hemp, see_rope)
	#if Input.is_action_pressed("left_click") and mouse_entered:
		#if has_overlapping_areas():
			#z_index += 1
		#else:
			#z_index = 0
	#drag_offset = global_position - event.position
#
#
##move the sticker, calls _get_ontop
#func _process(_delta):
	#if mouse == true:
		#global_position = get_global_mouse_position() + drag_offset
		#
	#if not Input.is_action_pressed("left_click") or not mouse_entered:
		#mouse = false
	#if Input.is_action_pressed("left_click") and mouse_entered:
		#mouse = true
		#
	#if global_position.y > 650:
		#global_position.y = 600
	#if global_position.x > Vector2(1150,720).x:
		#global_position.x = 1150
	#
	#if has_overlapping_areas():
		#for x in get_overlapping_areas():
			#if x not in StuffThatIsOverlappingWithOtherStuff:
				#StuffThatIsOverlappingWithOtherStuff.append(x)
	#if self not in StuffThatIsOverlappingWithOtherStuff:
				#StuffThatIsOverlappingWithOtherStuff.append(self)
	#
	#
