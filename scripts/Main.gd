extends Node2D

var shipTemplate
var orderTemplate
var shipListItemTemplate

var shipsData = {
	1 : {
		'id': 1
	},
	2 : {
		'id': 2
	},
	3 : {
		'id': 3
	},
}

var ordersData = {
	1 : {
		'id': 1,
		'title': 'Order1',
		'destination': Vector2(900, 900),
	},
	2 : {
		'id': 2,
		'title': 'Order2',
		'destination': Vector2(1000, 900),
	},
	3 : {
		'id': 3,
		'title': 'Order3',
		'destination': Vector2(700, 500),
	},
}

var currentShips  = {}
var currentOrders = {}

func _ready():
	orderTemplate        = preload("res://scenes/Order.tscn")
	shipListItemTemplate = preload("res://scenes/ShipListItem.tscn")
	
	initShips()
	initOrders()
	
	pass 

func initShips():
	get_tree().call_group("ships", "queue_free")
	for shipId in shipsData:
		var shipData = shipsData[shipId]
		addShip(shipData)
	
	updateShips()
	pass

func addShip(shipData):
	var ship : Ship = Ship.sc()
	ship.id = shipData.id
	
	currentShips[ship.id] = ship
	
	add_child(ship)
	pass
	
func updateShips():
	for shipId in currentShips:
		var ship = currentShips[shipId]
		var shipItem = shipListItemTemplate.instance() 
		#shipItem.get_node('Sprite').texture = ship.get_node('Sprite').texture
		shipItem.get_node('Id').text = str(ship.id)
		shipItem.get_node('Speed').text = str(ship.speed)
		shipItem.get_node('Capacity').text = str(ship.capacity)
		get_node("Ships").add_child(shipItem)
		shipItem.set_position(Vector2(0,(ship.id-1)*150))
	pass
	
func initOrders():
	get_tree().call_group("orders", "queue_free")
	for orderId in ordersData:
		var orderData = ordersData[orderId]
		addOrder(orderData)
	
	pass

func addOrder(orderData):
	var order = orderTemplate.instance()
	order.id = orderData.id
	order.title = orderData.title
	order.destination = orderData.destination
	
	currentOrders[order.id] = order
	
	get_node("Orders").add_child(order)
	order.updateList()
	
	pass
	
func updateOrders():
	for orderId in currentOrders:
		var order = currentOrders[orderId]
		order.updateList()
	pass
