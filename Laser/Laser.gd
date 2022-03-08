extends Area2D

const speed = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	position += Vector2(-1, 0).rotated(rotation) * speed * delta

func _process(delta: float) -> void:
	if !get_viewport_rect().has_point(position):
		queue_free()
#	pass


func _on_body_entered(body: Node) -> void:
	body.broke()
