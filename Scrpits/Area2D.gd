extends Area2D


@export var intensitat_salt := 700
@export var velocitatx := 100
func _on_body_entered(body):
	body.salta(intensitat_salt, velocitatx)
