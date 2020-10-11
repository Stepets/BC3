extends Node2D
class_name Map

export var color : Color

func _draw():
	draw_rect(get_viewport_rect(), color)
