extends Area2D

func _on_body_entered(body):
	body.monedes += 1
	queue_free()
