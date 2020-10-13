extends Resource
class_name ProductionData

export var name : String
export(Array, Resource) var consumes # ProductData
export(Array, Resource) var produces # ProductData
export var cycle_duration : int
var cycle_elapsed : float
