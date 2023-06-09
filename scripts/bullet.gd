extends Area2D

var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_bullet_body_entered(body:Node) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
	queue_free()
