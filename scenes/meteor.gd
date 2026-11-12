extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

func _ready() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	
	var width = get_viewport().get_visible_rect().size[0]
	
	var rand_x = rng.randi_range(0.0, width)
	var rand_y = rng.randi_range(-150, -50)
	position = Vector2(rand_x, rand_y)
	
	# speed / rotation / direction
	speed = rng.randf_range(200.0, 350.0)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	print("Body Entered: ", body)
