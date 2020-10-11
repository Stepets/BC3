extends KinematicBody2D
class_name Ship

var smoothSpeed = 0.5

var id = -1
var currentOrder = null

var status = 'free'

var speed = 1
var capacity = 10

var destinationDifference = Vector2()
var velocity = Vector2()

var ship_data : ShipData = preload("res://resource/medium_fighter.tres")

func _ready():
	add_to_group("ships")
	
	$Sprite.texture = ship_data.texture
	
	set_position(Vector2((id-1)*100, 50))
	
	pass

func _process(delta):
	if(currentOrder):
		if(currentOrder.destination - position <= Vector2(15,15)):
			stop()
		else:
			moneToDestination(delta)
	pass


func moneToDestination(delta):
	destinationDifference = currentOrder.destination - position
	velocity = destinationDifference * smoothSpeed * delta
	position += velocity
	pass

func getIcon():
	return  ship_data.icon

func start(order):
	status = 'work'
	currentOrder = order
	
	pass

func stop():
	status = 'free'
	currentOrder.stop()
	currentOrder = null
	
	pass

static func sc():
	return load("res://scenes/Ship.tscn").instance()
