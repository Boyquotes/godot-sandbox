extends CharacterBody2D

const MOTION_SPEED = 16 # Pixels/second.
const FRICTION_FACTOR = .75

func _physics_process(_delta):
	var motion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# Make diagonal movement fit isometric tiles.
	motion.y /= 2
	velocity += motion.normalized() * MOTION_SPEED
	# Apply friction.
	velocity *= FRICTION_FACTOR
	move_and_slide()
