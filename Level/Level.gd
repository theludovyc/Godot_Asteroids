extends Node2D

var Asteroid = preload("res://Asteroid/Asteroid.tscn")

onready var ship = $Ship

func pop_asteroid():
	var asteroid = Asteroid.instance()
	
	var viewport_size = get_viewport().size
	
	var center = viewport_size/2
	
	match(randi() % 4):
		0:
			asteroid.position = Vector2(rand_range(0, viewport_size.x), 0)
		1:
			asteroid.position = Vector2(0, rand_range(0, viewport_size.y))
		2:
			asteroid.position = Vector2(rand_range(0, viewport_size.x), viewport_size.y)
		3:
			asteroid.position = Vector2(viewport_size.x, rand_range(0, viewport_size.y))
	
	asteroid.direction = (asteroid.position.direction_to(ship.position) + Vector2(rand_range(-0.5, 0.5), rand_range(-0.5, 0.5))).normalized()
	
	add_child(asteroid)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	
	for i in 20:
		pop_asteroid()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
