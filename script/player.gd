extends CharacterBody2D


@export var SPEED = 400.0
@export_range(0,1) var deceleration = 0.1
@export_range(0,1) var acceleration = 0.1
@export_range(0,1) var deceleration_jump = 0.5
const JUMP_VELOCITY = -750.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_audio: AudioStreamPlayer2D = $"jump audio"

var lives: int = 3

func _ready() -> void:
	update_life_display()
# Fungsi untuk menerima hit dari musuh
func take_damage():
	lives -= 1
	update_life_display()
	if lives <= 0 :
		restart_game()
func update_life_display():
	print("life remaining:", lives)
func  restart_game():
	get_tree().reload_current_scene()


func jump():
	velocity.y += JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_wall()):
		velocity.y = JUMP_VELOCITY
		jump_audio.play()
	if Input.is_action_just_released("jump") and velocity.y < 0 :
		velocity.y *= deceleration_jump


	# penunjuk arah: -1, 0, 1
	var direction := Input.get_axis("left", "right")
	#flip player
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	# arah gerak
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED * acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0,SPEED * deceleration)
	
	
	# animasi
	if direction == 0:
		animated_sprite_2d.play("idle")
	elif direction > 0:
		animated_sprite_2d.play("run")
	elif direction < 0:
		animated_sprite_2d.play("run")
	if not is_on_floor():
		animated_sprite_2d.play("jump")
	
	move_and_slide()
