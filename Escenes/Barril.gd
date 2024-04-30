extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func explota():
	$AnimacióExplosió.play("explosió")



func _on_animacióexplosió_animation_finished():
	queue_free()
