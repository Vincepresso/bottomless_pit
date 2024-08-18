extends Node

# playeground_scene butler
const PLAYGROUND_SCENE = "res://map/playground.tscn"
var game_start = false
var game_over = false
var paused = false
var total_score = 0.0
var score_soft_cap = 100
var food_eaten = 0
var poop_eaten = 0
var max_poop_eaten = 5
var player_speed = 0.0
var player_belly_scale = 0.0
var player_health = 0.0
var poop_spawn_rate = 0.0
var hunger_rate = 5.0
var retry = false

func reset_states():
	game_start = false
	game_over = false
	paused = false
	total_score = 0.0
	score_soft_cap = 100
	food_eaten = 0
	poop_eaten = 0
	max_poop_eaten = 5
	player_speed = 0.0
	player_belly_scale = 0.0
	player_health = 0.0
	poop_spawn_rate = 0.0
	hunger_rate = 5.0
	retry = false

# start_scene butler
const START_SCENE = "res://map/start_scene.tscn"
var splash_screen_done = false
var player_start_sad = false
var player_start_dance = false
var main_menu_start_pressed = false
var main_menu_quit_pressed = false
var start_scene_ready = false
