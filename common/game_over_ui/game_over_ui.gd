extends Control

@onready var timer = $Timer
@onready var retry_button = $GameOverContainer/VBoxContainer/RetryButton
@onready var animation_player = $AnimationPlayer

var enabled = false

func _ready():
	visible = false
	retry_button.disabled = true

func _process(delta):
	if GameManager.game_over and not enabled:
		enabled = true
		timer.start()

func _on_timer_timeout():
	visible = true
	retry_button.disabled = false

func _on_retry_button_pressed():
	retry_button.disabled = true
	animation_player.play("transition")
	await animation_player.animation_finished
	get_tree().reload_current_scene()

func reset_states():
	GameManager.reset_states()
