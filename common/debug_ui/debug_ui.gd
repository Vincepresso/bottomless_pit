extends VBoxContainer

@onready var fps_value = $GridContainer/fps_value
@onready var score_value = $GridContainer/score_value
@onready var food_eaten_value = $GridContainer/food_eaten_value
@onready var poop_eaten_value = $GridContainer/poop_eaten_value
@onready var poop_spawn_rate_value = $GridContainer/poop_spawn_rate_value
@onready var belly_scale_value = $GridContainer/belly_scale_value
@onready var player_speed_value = $GridContainer/player_speed_value


func _process(delta):
	fps_value.text = str(Engine.get_frames_per_second())
	score_value.text = str(GameManager.total_score)
	food_eaten_value.text = str(GameManager.food_eaten)
	poop_eaten_value.text = str(GameManager.poop_eaten)
	poop_spawn_rate_value.text = str(GameManager.poop_spawn_rate)
	belly_scale_value.text = str(GameManager.player_belly_scale)
	player_speed_value.text = str(GameManager.player_speed)
