extends Node
class_name Planet

export var data_r : Resource
onready var data : PlanetData = data_r as PlanetData

func _process(delta):
	if data.is_orbiting():
		data.angle += data.angular_speed * delta
	for prod in data.productions:
		prod = prod as ProductionData
		if prod.cycle_elapsed < prod.cycle_duration:
			prod.cycle_elapsed += delta
		if prod.cycle_elapsed >= prod.cycle_duration:
			var storage_required = {}
			for item in prod.produces:
				item = item as ProductData
				if not storage_required.has(item.type):
					storage_required[item.type] = 0
				storage_required[item.type] += 1
			var enough_space = true
			for item_type in storage_required.keys():
				if data.get_free(item_type) < storage_required[item_type]:
					enough_space = false
					break
			if not enough_space:
				continue
			
			for item_type in storage_required.keys():
				data.consume_storage(item_type, storage_required[item_type])

func get_host():
	return get_node(data.host)
