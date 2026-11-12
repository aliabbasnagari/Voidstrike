extends Area2D

@export var speed:int = 500

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	position += Vector2(0.0, -1.0) * speed * delta

func _on_body_entered(body: Node2D) -> void:
	print(body)
