extends CenterContainer

var enabled = false

func _process(delta):
	if GameManager.game_over and not enabled:
		enabled = true
		visible = true
