extends CanvasLayer

static var life_image = load("res://kenney-space-shooter/PNG/UI/playerLife1_red.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _set_health(amount: int):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var life = TextureRect.new()
		life.texture = life_image
		$MarginContainer2/HBoxContainer.add_child(life)
		
