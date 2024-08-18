extends Label

@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

func _ready():
	animation_player.play("fade")
	await animation_player.animation_finished
	timer.start()

func _on_timer_timeout():
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	GameManager.game_start = true
