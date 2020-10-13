extends Popup
class_name PlanetUI

func _ready():
	connect("popup_hide", self, "on_close")

func on_close():
	get_tree().paused = false

func fill(planet : PlanetData) -> void:
	$Panel/Label.text = planet.name

static func sc():
	return load("res://scenes/PlanetUI.tscn").instance()

