extends VBoxContainer


@onready var vomit_progress_bar = $VomitContainer/ProgressBarTexture/ProgressBar

func _process(delta):
	vomit_progress_bar.value = (float(GameManager.poop_eaten) / float(GameManager.max_poop_eaten)) * 100.0
