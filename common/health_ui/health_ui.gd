extends VBoxContainer

@onready var hunger_progress_bar = $HungerContainer/ProgressBarTexture/ProgressBar
@onready var vomit_progress_bar = $VomitContainer/ProgressBarTexture/ProgressBar

func _process(delta):
	vomit_progress_bar.value = (float(GameManager.poop_eaten) / float(GameManager.max_poop_eaten)) * 100.0
	hunger_progress_bar.value = GameManager.player_health
