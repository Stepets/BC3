extends Viewport
class_name ViewportWithContext

var components : Dictionary = {}
const stub = {}

func find(data, type):
	return components.get(data, stub).get(type)

func register(data, type, value):
	if not components.has(data):
		components[data] = {}
	components[data][type] = value

func remove(data, type):
	components.get(data, stub).erase(type)

func erase(data):
	components.erase(data)

func clear():
	components.clear()
