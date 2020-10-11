extends Button

var game_scene = preload("res://scenes/Map.tscn")

func _ready():
	connect("button_up", get_tree().current_scene, "switch_to", [game_scene.instance()])
