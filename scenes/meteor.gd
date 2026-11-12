extends Area2D

var speed = 10.0
var direction = Vector2(0.0, 0.0)
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	var width = get_viewport().get_visible_rect().size[0]
	var height = get_viewport().get_visible_rect().size[1]
	
	var rand_x = rng.randf_range(0.0, width)
	var rand_y = rng.randf_range(-150, -50)
	position = Vector2(rand_x, rand_y)
	
	rand_x = rng.randf_range(-1.0, 1.0)
	rand_y = rng.randf_range(-1.0, 1.0)
	direction = Vector2(rand_x, rand_y)

func _process(delta: float) -> void:
	position += direction * speed

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
