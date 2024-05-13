extends Area2D

@export var escena_Game_over : PackedScene
var velocitat = Vector2.RIGHT * (50 + Global.ronda*3)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocitat * delta


func _on_body_entered(_body):
	get_tree().change_scene_to_file("res://Escenes/mort_menu.tscn")
