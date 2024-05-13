extends Area2D




func _on_body_entered(body):
	#body.recomenca()
	Global.ronda += 1
	get_tree().reload_current_scene()
