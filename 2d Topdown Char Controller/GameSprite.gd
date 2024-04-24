extends Sprite2D

var direction
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_animation = "left"
	if direction:
		if direction.x == -1:
			new_animation = "left"
		if direction.x == 1: #right
			new_animation = "right"
		if direction.y == -1:
			new_animation = "up"
		if direction.y == 1: #down
			new_animation = "down"
		$AnimationPlayer.play(new_animation)
	else:
		$AnimationPlayer.stop()
	direction = Vector2.ZERO


func _on_player_face(dir):
	direction = dir
