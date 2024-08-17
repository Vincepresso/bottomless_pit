class_name Player extends CharacterBody3D

@export var health = 100.0
@export var speed_min = 1.0
@export var speed_max = 4.0
@export var jump_velocity = 4.5
@export var enable_jump = false
@export var belly_scale_min = 0.1
@export var belly_scale_max = 0.5
@export var crunch_pitch_min = 0.8
@export var crunch_pitch_max = 1.2
@export var footsteps_list: Array[AudioStreamWAV] = []

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var face_right = true
var last_footstep = null
var speed = 0.0
var hungry = false

@onready var skin = $Skin
@onready var animation_tree = $AnimationTree
@onready var footsteps_sfx = $FootstepsSfx
@onready var belly = $Skin/Man/Armature/GeneralSkeleton/HipsBoneAttachment/Belly
@onready var crunch_sfx = $CrunchSfx
@onready var hunger_timer = $HungerTimer
@onready var died_ray_cast = $Skin/DiedRayCast

func _ready():
	speed = speed_max
	GameManager.player_health = health

func _process(delta):
	if not hungry and GameManager.game_start:
		hungry = true
		await get_tree().create_timer(2.0).timeout
		hunger_timer.start()

func _physics_process(delta):
	handle_gravity(delta)
	handle_movement()
	handle_animation()
	flip_skin()
	move_and_slide()

func handle_gravity(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	if enable_jump and Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

func handle_movement():
	var input_dir = Input.get_vector("up", "down", "right", "left")
	if GameManager.game_over or not GameManager.game_start:
		input_dir = Vector2.ZERO
	var direction = (transform.basis * Vector3(0, 0, input_dir.y)).normalized()
	if direction:
		velocity.z = direction.z * speed
	else:
		velocity.z = move_toward(velocity.z, 0, speed)

func handle_animation():
	animation_tree.set("parameters/movement/blend_position", abs(velocity.z))

func flip_skin():
	if face_right and velocity.z > 0:
		skin.transform.basis = skin.transform.basis.rotated(Vector3.UP, PI)
		face_right = false
	if not face_right and velocity.z < 0:
		skin.transform.basis = skin.transform.basis.rotated(Vector3.UP, PI)
		face_right = true

func play_footsteps_sfx():
	var random_footstep = footsteps_list[randi() % footsteps_list.size()]
	while random_footstep == last_footstep:
		random_footstep = footsteps_list[randi() % footsteps_list.size()]
	footsteps_sfx.stream = random_footstep
	footsteps_sfx.play()

func eat_food(food : Food):
	if not GameManager.game_over:
		GameManager.food_eaten += 1
		GameManager.total_score += food.score
		if not crunch_sfx.playing:
			crunch_sfx.pitch_scale = randf_range(crunch_pitch_min, crunch_pitch_max)
			crunch_sfx.play()

		health = clampf(health + food.health, 0.0, 100.0)
		GameManager.player_health = health

		var belly_scale_value = (belly_scale_max - belly_scale_min) / GameManager.score_soft_cap
		belly.scale.x = clampf(belly.scale.x + belly_scale_value * food.score, belly_scale_min, belly_scale_max)
		belly.scale.y = clampf(belly.scale.y + belly_scale_value * food.score, belly_scale_min, belly_scale_max)
		belly.scale.z = clampf(belly.scale.z + belly_scale_value * food.score, belly_scale_min, belly_scale_max)
		GameManager.player_belly_scale = belly.scale.x

		var speed_scale_value = (speed_max - speed_min) / GameManager.score_soft_cap
		speed = clampf(speed - speed_scale_value * food.score, speed_min, speed_max)
		GameManager.player_speed = speed

func eat_poop(poop: Poop):
	if not GameManager.game_over:
		GameManager.poop_eaten += 1
		if not crunch_sfx.playing:
			crunch_sfx.pitch_scale = randf_range(crunch_pitch_min, crunch_pitch_max)
			crunch_sfx.play()

		if GameManager.poop_eaten >= GameManager.max_poop_eaten:
			GameManager.game_over = true
			animation_tree.set("parameters/conditions/vomit", true)

func _on_hunger_timer_timeout():
	health = clampf(health - GameManager.hunger_rate, 0.0, 100.0)
	GameManager.player_health = health
	if health <= 0.0 and not GameManager.game_over:
		GameManager.game_over = true
		if died_ray_cast.is_colliding() and died_ray_cast.get_collider().is_in_group("wall"):
			skin.transform.basis = skin.transform.basis.rotated(Vector3.UP, PI)
		animation_tree.set("parameters/conditions/died", true)
