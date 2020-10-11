extends Node
class_name State

func _ready():
	var context : ViewportWithContext = get_viewport()
	context.register(null, "State", self)

func planets() -> Array:
	return $Planets.get_children()
