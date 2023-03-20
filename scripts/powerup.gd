extends Area2D


func _on_powerup_body_entered(body:Node) -> void:
	queue_free()
