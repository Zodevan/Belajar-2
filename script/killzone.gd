extends Area2D

@onready var timer: Timer = $Timer
@onready var explosionsfx: AudioStreamPlayer2D = $explosionsfx



func _on_body_entered(body: Node2D) -> void:
	timer.start()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	explosionsfx.play()
	
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass
