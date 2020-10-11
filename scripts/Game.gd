extends ViewportContainer
class_name SceneManager

var menu_scene = preload("res://scenes/Menu.tscn")

func _ready():
	switch_to(menu_scene.instance())

func switch_to(scene):
	call_deferred("do_switch_to", scene)
	
func do_switch_to(scene):
	for c in get_children():
		remove_child(c)
		c.free()
	add_child(scene)
	get_tree().get_frame()
	
	fix_viewport_size()

func fix_viewport_size():
	var orig_rect_size = rect_size
	rect_size = Vector2()
	rect_size = orig_rect_size
