extends Node2D

var id = -1
var title = -1
var destination = Vector2(100,100)

var status = 'open'

func _ready():
	add_to_group("orders")
	
	set_global_position(Vector2((id-1)*250,900))
	get_node("Description").text = "Destination: ("+str(destination.x)+","+str(destination.y)+")"
	get_node("StatusText").text = status
	pass

func _on_Button_pressed():
	start()
	pass 

func start():
	var list = get_node('List')
	var selected = list.get_selected_items()
	if(!selected.empty()):
		status = 'process'
		
		list.hide()
		get_node('Button').hide()
		get_node("StatusText").text = status
		
		var currentShips = get_parent().currentShips
		for selectedId in selected:
			var shipId = list.get_item_metadata(selectedId)
			var ship   = currentShips[shipId]
			ship.start(self)
	
		get_parent().updateOrders()
	pass

func stop():
	status = 'complited'
	get_node("StatusText").text = status
	get_parent().updateOrders()
	
	pass
	
func updateList():
	var list = get_node('List')
	list.clear()
	
	var currentShips = get_parent().currentShips
	for shipId in currentShips:
		var ship : Ship = currentShips[shipId]
		if(ship.status == 'free'):
			#var shipIcon = ship.getIcon()
			
			var idx = list.get_item_count()
			list.add_item(str(ship.id))
			list.set_item_icon(idx, ship.getIcon())
			list.set_item_metadata(idx, ship.id)
	pass
