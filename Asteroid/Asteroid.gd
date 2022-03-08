extends KinematicBody2D

const min_speed = 20
const max_speed = 30

var direction = Vector2(1, 0)
var speed:float

onready var sprite = $Sprite

func _physics_process(delta: float) -> void:
	rotate(delta)
	
	var coll = move_and_collide(direction * speed * delta)
	
	if coll:
		direction = direction.bounce(coll.normal).normalized()

func _process(delta: float) -> void:
	if !get_viewport_rect().has_point(position):
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = rand_range(min_speed, max_speed)
	pass # Replace with function body.

func broke():
	queue_free()
