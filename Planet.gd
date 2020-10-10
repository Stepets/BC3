extends Node2D
class_name Planet

export var data_r : Resource
export var orbit_r : Resource
onready var data : PlanetData = data_r as PlanetData
onready var orbit : OrbitData = orbit_r as OrbitData

func _ready():
	$Label.text = data.name

func _draw():
	draw_circle(Vector2(), data.radius, data.color)

func _process(delta):
	if orbit != null:
		orbit.angle += orbit.angular_speed * delta
		var host : Node2D = get_node(orbit.host)
		set_global_position(host.get_global_position() + Vector2(orbit.radius * cos(orbit.angle), orbit.radius * sin(orbit.angle)))

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if (get_global_position() - event.position).length() < data.radius:
			var planet_ui : PlanetUI = PlanetUI.sc()
			GlobalCanvasLayer.set_ui(planet_ui)
			planet_ui.show()
			get_tree().paused = true
			get_tree().set_input_as_handled()
