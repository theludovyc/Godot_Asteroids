extends KinematicBody2D

const rot_ratio = 0.5

var Laser = preload("res://Laser/Laser.tscn")

var speed = 100.0

var direction:Vector2

onready var timer = $Timer

func _process(delta:float):
	pass

func _physics_process(delta: float) -> void:
	var angle = global_position.angle_to_point(get_global_mouse_position())
	
	set_rotation(lerp_angle(rotation, angle, rot_ratio))
	
	move_and_slide(direction.normalized() * speed)

func shot():
	var laser = Laser.instance()
		
	laser.position = position + Vector2(-25, 0).rotated(rotation)
	laser.rotation = rotation
	
	get_parent().add_child(laser)

func _input(event: InputEvent) -> void:
	direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))

	if Input.is_action_just_pressed("shoot"):
		shot()
		timer.start()
		
	if Input.is_action_just_released("shoot"):
		timer.stop()

func _on_Timer_timeout() -> void:
	shot()
