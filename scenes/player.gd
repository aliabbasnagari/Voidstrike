extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var speed = 120.0
	if Input.is_action_pressed("ui_right"):
		position += Vector2(1.0, 0) * speed * delta
		rotation = 0.3
	if Input.is_action_pressed("ui_left"):
		position -= Vector2(1.0, 0) * speed * delta
		rotation = -0.3
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		rotation = 0
		
	if Input.is_action_pressed("ui_up"):
		position -= Vector2(0, 1.0) * speed * delta
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0, 1.0) * speed * delta
	
