extends Resource
class_name ProductData

enum Type {
	LIQUID, GAS, SOLID
}

export var name : String
export(Type) var type
