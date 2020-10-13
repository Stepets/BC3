extends Node2D
class_name PlanetView

var planet : Planet
var data : PlanetData

func init(planet : Planet):
	self.planet = planet
	self.data = planet.data

func _ready():
	$Label.text = data.name
	var context : ViewportWithContext = get_viewport()
	context.register(planet, "PlanetView", self)

func _draw():
	draw_circle(Vector2(), data.radius, data.color)

func _process(delta):
	if data.is_orbiting():
		var host : Planet = planet.get_host()
		var context : ViewportWithContext = get_viewport()
		var host_view = context.find(host, "PlanetView")
		set_global_position(host_view.get_global_position() + Vector2(data.orbit_radius * cos(data.angle), data.orbit_radius * sin(data.angle)))

func _input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		print(get_global_position() - event.position)
		if (get_global_position() - event.position).length() < data.radius:
			var planet_ui : PlanetUI = PlanetUI.sc()
			planet_ui.fill(data)
			var context : ViewportWithContext = get_viewport()
			var canvas_layer : GlobalCanvasLayer = context.find(null, "GlobalCanvasLayer")
			canvas_layer.set_ui(planet_ui)
			planet_ui.show()
			get_tree().paused = true
			get_tree().set_input_as_handled()

func _unhandled_input(event):
	print("unhandled input", event)
	_input(event)

static func mew():
	return load("res://scenes/Planet.tscn").instance()
