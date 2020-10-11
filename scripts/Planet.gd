extends Node
class_name Planet

export var data_r : Resource
onready var data : PlanetData = data_r as PlanetData

func _process(delta):
	if data.is_orbiting():
		data.angle += data.angular_speed * delta

func get_host():
	return get_node(data.host)
