extends Resource
class_name PlanetData

export var name : String
export var color : Color
export var radius : int

export var host : NodePath
export var orbit_radius : int
export var angular_speed : float
export var angle : float

func is_orbiting() -> bool:
	return not host.is_empty()
