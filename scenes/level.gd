extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var health: int = 5

func _ready() -> void:
	get_tree().call_group("ui", '_set_health', health)

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	if health > 0:
		health -= 1
	else:
		print("GAME OVER")
	get_tree().call_group("ui", '_set_health', health)

func _on_player_laser(pos: Variant) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
