extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

signal collision
signal hit_laser

func _ready() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	
	var width = get_viewport().get_visible_rect().size[0]
	var rand_x = rng.randi_range(0, width)
	var rand_y = rng.randi_range(-150, -50)
	position = Vector2(rand_x, rand_y)
	
	# speed / rotation / direction
	speed = rng.randi_range(200, 350)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	collision.emit()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
	hit_laser.emit()
