extends RigidBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var game_manager: Node = %game_manager
@onready var damagedsfx: AudioStreamPlayer2D = $damagedsfx
@onready var explosionsfx: AudioStreamPlayer2D = $explosionsfx


var health = 2


func _on_area_2d_body_entered(body: Node2D) -> void:
	if ( body.name == "player"):
		timer.start()
		body.jump()
		animated_sprite_2d.play("damaged")
		health -= 1
		damagedsfx.play()


func _on_timer_timeout() -> void:
	if health >= 1 :
		animated_sprite_2d.play("idle")
	else :
		animated_sprite_2d.play("die")
		collision_shape_2d.queue_free()
		game_manager.add_coin()
		explosionsfx.play()




func _on_pandagan_kiri_body_entered(body: Node2D) -> void:
	if (body.name==("player")):
		animated_sprite_2d.flip_h = true


func _on_pandagan_kiri_body_exited(body: Node2D) -> void:
	if (body.name==("player")):
		animated_sprite_2d.flip_h = false
