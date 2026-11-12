extends CanvasLayer

static var life_image = load("res://kenney-space-shooter/PNG/UI/playerLife1_red.png")

func _set_score(amount: int):
	$MarginContainer/ScoreLabel.text = str(amount)
	
func _set_health(amount: int):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in amount:
		var life = TextureRect.new()
		life.texture = life_image
		life.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
		$MarginContainer2/HBoxContainer.add_child(life)
		
