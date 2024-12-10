extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCast_right
@onready var ray_cast_2d_left: RayCast2D = $RayCast2D_left

const SPEED = 100
var direction = 1

func _process(delta):
	position.x += direction * SPEED * delta
	
		
	if ray_cast_2d_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	
