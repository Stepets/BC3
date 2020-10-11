extends KinematicBody2D

var smoothSpeed = 0.5

var id = -1
var currentOrder = null

var status = 'free'

var speed = 1
var capacity = 10

var destinationDifference = Vector2()
var velocity = Vector2()

func _ready():
	add_to_group("ships")
	
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
	
	return  get_node('Sprite').texture
	
	pass

func start(order):
	status = 'work'
	currentOrder = order
	
	pass

func stop():
	status = 'free'
	currentOrder.stop()
	currentOrder = null
	
	pass
