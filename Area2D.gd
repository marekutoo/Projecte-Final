extends Area2D


@export var intensitat_salt := 800

func _on_body_entered(body):
	body.salta(intensitat_salt)