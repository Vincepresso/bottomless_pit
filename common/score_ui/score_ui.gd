extends HBoxContainer

@onready var score_value = $Value

func _process(delta):
	score_value.text = str(GameManager.total_score)
