extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %game_manager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var score = 0

func _on_body_entered(body):
	if (body.name == "player"):
		game_manager.add_coin()
		animation_player.play("pickup")
