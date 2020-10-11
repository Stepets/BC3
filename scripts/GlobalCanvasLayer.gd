extends CanvasLayer
class_name GlobalCanvasLayer

func set_ui(ui):
	for c in get_children():
		remove_child(c)
		c.free()
	add_child(ui)
