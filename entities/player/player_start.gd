extends Node3D

@export var clap_pitch_min = 0.9
@export var clap_pitch_max = 1.1

var lets_go_sfx_have_played = false
var bye_sfx_have_played = false

@onready var animation_tree = $AnimationTree
@onready var lets_go_sfx = $LetsGoSfx
@onready var bye_sfx = $ByeSfx
@onready var clap_sfx = $ClapSfx

func _ready():
	animation_tree.active = true
	animation_tree.set("parameters/conditions/happy", true)
	animation_tree.set("parameters/conditions/sad", false)
	lets_go_sfx.autoplay = false
	bye_sfx.autoplay = false

func _process(delta):
	if GameManager.start_scene_ready:

		if GameManager.player_start_sad and not animation_tree.get("parameters/conditions/sad"):
			animation_tree.set("parameters/conditions/sad", true)
			animation_tree.set("parameters/conditions/happy", false)
			animation_tree.set("parameters/conditions/dance", false)

		if not GameManager.player_start_sad and not animation_tree.get("parameters/conditions/happy"):
			animation_tree.set("parameters/conditions/happy", true)
			animation_tree.set("parameters/conditions/sad", false)
			animation_tree.set("parameters/conditions/dance", false)

		if GameManager.player_start_dance and not animation_tree.get("parameters/conditions/dance"):
			animation_tree.set("parameters/conditions/dance", true)
			animation_tree.set("parameters/conditions/happy", false)
			animation_tree.set("parameters/conditions/sad", false)

		if GameManager.main_menu_start_pressed and not lets_go_sfx.playing and not lets_go_sfx_have_played:
			lets_go_sfx_have_played = true
			lets_go_sfx.play()

		if GameManager.main_menu_quit_pressed and not bye_sfx.playing and not bye_sfx_have_played:
			bye_sfx_have_played = true
			bye_sfx.play()

func play_clap_sfx():
	if not clap_sfx.playing:
		clap_sfx.pitch_scale = randf_range(clap_pitch_min, clap_pitch_max)
		clap_sfx.play()
