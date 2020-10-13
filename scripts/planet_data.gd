extends Resource
class_name PlanetData

export var name : String
export var color : Color
export var radius : int

export var host : NodePath
export var orbit_radius : int
export var angular_speed : float
export var angle : float

export var max_spaceports : int
export(Array, Resource) var spaceports # SpaceportData

export var max_productions : int
export(Array, Resource) var productions # ProductionData

export var max_storages : int
export(Array, Resource) var storages # StorageData

func is_orbiting() -> bool:
	return not host.is_empty()

func get_free_storage(type) -> int:
	var free : int = 0
	for storage in storages:
		storage = storage as StorageData
		if storage.type == type:
			free += storage.free_size
	return free

func consume_storage(type, vol : int):
	for storage in storages:
		storage = storage as StorageData
		if storage.type == type:
			if storage.free_size >= vol:
				storage.free_size -= vol
				return
			else:
				vol -= storage.free_size
				storage.free_size = 0
