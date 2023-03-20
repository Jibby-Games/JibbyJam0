extends Area2D


func _on_powerup_body_entered(body:Node) -> void:
	Sounds.play("res://sounds/Eat_Up.mp3")
	Sounds.play("res://sounds/PowerUp.mp3")
	queue_free()

