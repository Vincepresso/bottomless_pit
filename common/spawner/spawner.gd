extends Path3D

@export var pantry: Array[PackedScene]
@export var poop_scene: PackedScene
@export var food_spawn_rate = 2.0
@export var poop_spawn_rate_max = 4.0
@export var poop_spawn_rate_min = 0.25

var poop_spawn_rate = 0.0

@onready var food_spawn_timer = $FoodSpawnTimer
@onready var poop_spawn_timer = $PoopSpawnTimer
@onready var spawn_point = $SpawnPoint

func _ready():
	food_spawn_timer.start(food_spawn_rate)
	poop_spawn_rate = poop_spawn_rate_max
	poop_spawn_timer.start(poop_spawn_rate)

func _on_food_spawn_timer_timeout():
	if not GameManager.game_over:
		var food = pantry.pick_random().instantiate() as Food
		spawn_point.progress_ratio = randf()
		add_child(food)
		food.init(spawn_point.transform.origin)
		food_spawn_timer.start(food_spawn_rate)

func _on_poop_spawn_timer_timeout():
	if not GameManager.game_over:
		var percent_to_full = clampf(GameManager.total_score / GameManager.score_soft_cap, 0.0, 1.0)
		var poop_spawn_rate_delta = poop_spawn_rate_max - poop_spawn_rate_min
		poop_spawn_rate = clampf((1-percent_to_full) * poop_spawn_rate_delta, poop_spawn_rate_min, poop_spawn_rate_max)
		var poop = poop_scene.instantiate() as Poop
		spawn_point.progress_ratio = randf()
		add_child(poop)
		poop.init(spawn_point.transform.origin)
		poop_spawn_timer.start(poop_spawn_rate)
		GameManager.poop_spawn_rate = poop_spawn_rate

func _on_despawn_point_area_entered(area):
	if area.is_in_group("food") or area.is_in_group("poop"):
		area.queue_free()
