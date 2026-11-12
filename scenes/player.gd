extends CharacterBody2D

@export var speed: float = 120.0

signal laser(pos, rot)
var laser_ready: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	rotation_degrees = direction.x * 20
	velocity = direction * speed
	
	print(get_angle(position, $LaserMarker.global_position) + 90)
	
	if Input.is_action_just_pressed("shoot") and laser_ready:
		laser.emit($LaserMarker.global_position, get_angle(position, $LaserMarker.global_position) + 90)
		laser_ready = false
		$LaserTimer.start()
	
	move_and_slide()
	
func _on_laser_timer_timeout() -> void:
	laser_ready = true
	
func get_angle(from: Vector2, to: Vector2) -> float:
	return rad_to_deg((to - from).angle())
