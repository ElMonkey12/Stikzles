extends Control

const ThegameFRL := preload("res://backgroundsvdjbihbv.tscn")
@onready var plya = get_node("panel contanier/VBoxContainer/Plya")

func _ready():
	plya.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://backgroundsvdjbihbv.tscn")
