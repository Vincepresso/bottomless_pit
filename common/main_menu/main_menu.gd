extends Control

@onready var animation_tree = $AnimationTree
@onready var start_button = $MenuContainer/StartButton
@onready var quit_button = $MenuContainer/QuitButton

func _ready():
	animation_tree.active = true

func _process(delta):
	if GameManager.splash_screen_done and not animation_tree.get("parameters/conditions/fade_in"):
		animation_tree.set("parameters/conditions/fade_in", true)

func _on_start_button_pressed():
	GameManager.main_menu_start_pressed = true
	SceneTransition.change_scene(GameManager.PLAYGROUND_SCENE)

func _on_quit_button_pressed():
	GameManager.main_menu_quit_pressed = true
	await get_tree().create_timer(1.0).timeout
	get_tree().quit()

func _on_start_button_mouse_entered():
	if GameManager.start_scene_ready:
		GameManager.player_start_dance = true

func _on_start_button_mouse_exited():
	if GameManager.start_scene_ready:
		GameManager.player_start_dance = false

func _on_quit_button_mouse_entered():
	if GameManager.start_scene_ready:
		GameManager.player_start_sad = true

func _on_quit_button_mouse_exited():
	if GameManager.start_scene_ready:
		GameManager.player_start_sad = false

func set_start_scene_ready(value):
	GameManager.start_scene_ready = value
