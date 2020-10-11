extends Node2D
class_name Map

export var color : Color

func _draw():
	draw_rect(get_viewport_rect(), color)

func _ready():
	var context : ViewportWithContext = get_viewport()
	var state : State = context.find(null, "State")
	for p in state.planets():
		var view : PlanetView = PlanetView.mew()
		view.init(p)
		add_child(view)
		if not view.data.is_orbiting():
			call_deferred("place_centered", view)

func place_centered(view : PlanetView) -> void:
	view.position = get_viewport().size / 2

