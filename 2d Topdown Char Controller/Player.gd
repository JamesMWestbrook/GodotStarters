extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal Face(dir)

func _physics_process(delta):
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var hor = Input.get_axis("MoveLeft","MoveRight")
	var ver = -Input.get_axis("MoveDown","MoveUp")
	var direction = Vector2(hor, ver)
	if direction:
		velocity = direction * SPEED
		Face.emit(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		pass

	move_and_slide()
