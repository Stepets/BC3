extends Popup
class_name PlanetUI

func _ready():
	connect("popup_hide", self, "on_close")

func on_close():
	get_tree().paused = false

static func sc():
	return load("res://PlanetUI.tscn").instance()

