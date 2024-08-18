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
	print("Start Button is Pressed")
	GameManager.main_menu_start_pressed = true

func _on_quit_button_pressed():
	print("Quit Button is Pressed")
	GameManager.main_menu_quit_pressed = true

func _on_start_button_mouse_entered():
	GameManager.player_start_dance = true

func _on_start_button_mouse_exited():
	GameManager.player_start_dance = false

func _on_quit_button_mouse_entered():
	GameManager.player_start_sad = true

func _on_quit_button_mouse_exited():
	GameManager.player_start_sad = false
