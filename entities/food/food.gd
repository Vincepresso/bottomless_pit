class_name Food extends Area3D

@export var min_speed = 1.0
@export var max_speed = 3.0
@export var score = 0.0
@export var health = 10.0

var speed = 0.0

func init(start_position):
	transform.origin = start_position
	speed = randf_range(min_speed, max_speed)

func _process(delta):
	transform.origin -= transform.basis.y.normalized() * speed * delta

func _on_body_entered(body):
	if not GameManager.game_over and body.is_in_group("player"):
		var player = body as Player
		player.eat_food(self)
		queue_free()
