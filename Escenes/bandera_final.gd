extends Area2D




func _on_body_entered(body):
	#body.recomenca()
	Global.ronda += 0
	get_tree().reload_current_scene()
