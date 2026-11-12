extends Area2D

@export var speed:int = 500

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1,1), 0.2).from(Vector2(0,0))
	
func _process(delta: float) -> void:
	position += get_direction(rotation_degrees - 90) * speed * delta

func _on_body_entered(body: Node2D) -> void:
	print(body)
	
func get_direction(angle_degrees: float) -> Vector2:
	var radians = deg_to_rad(angle_degrees)
	return Vector2(cos(radians), sin(radians))
