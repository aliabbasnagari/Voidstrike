extends CharacterBody2D

@export var speed: float = 120.0

signal laser(pos)
var laser_ready: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	rotation = direction.x * 0.3
	velocity = direction * speed
	
	if Input.is_action_just_pressed("shoot") and laser_ready:
		laser.emit($LaserMarker.global_position)
		laser_ready = false
		$LaserTimer.start()
	
	move_and_slide()
	


func _on_laser_timer_timeout() -> void:
	laser_ready = true
