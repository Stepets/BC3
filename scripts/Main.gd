extends Node2D

var shipTemplate
var orderTemplate

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
	orderTemplate      = preload("res://scenes/Order.tscn")
	
	initShips()
	initOrders()
	
	pass 

func initShips():
	get_tree().call_group("ships", "queue_free")
	for shipId in shipsData:
		var shipData = shipsData[shipId]
		addShip(shipData)
	
	pass

func addShip(shipData):
	var ship : Ship = Ship.sc()
	ship.id = shipData.id
	
	currentShips[ship.id] = ship
	
	add_child(ship)
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
	order.destination = orderData.destination
	
	currentOrders[order.id] = order
	
	add_child(order)
	order.updateList()
	
	pass
	
func updateOrders():
	print(1)
	for orderId in currentOrders:
		var order = currentOrders[orderId]
		order.updateList()
	pass
