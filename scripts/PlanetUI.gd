extends Popup
class_name PlanetUI

var item = preload("res://scenes/TextItem.tscn")

func _ready():
	connect("popup_hide", self, "on_close")

func on_close():
	get_tree().paused = false

func fill(planet : PlanetData) -> void:
	$Panel/PlanetNameLabel.text = planet.name
	for port in planet.spaceports:
		var n = item.instance()
		n.text = port.name
		$Panel/SpaceportsGridContainer.add_child(n)
	for prod in planet.productions:
		var n = item.instance()
		n.text = prod.name
		$Panel/ProductionsGridContainer.add_child(n)
	for storage in planet.storages:
		storage = storage as StorageData
		var n = item.instance()
		n.text = storage.name + " (" + String(storage.size - storage.free_size) + "/" + String(storage.size) + ")"
		$Panel/SpaceportsGridContainer.add_child(n)

static func sc():
	return load("res://scenes/PlanetUI.tscn").instance()

