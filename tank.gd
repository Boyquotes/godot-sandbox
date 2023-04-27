extends CharacterBody2D

const MOTION_SPEED = 48 # Pixels/second.

func _physics_process(_delta):
	var motion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Make diagonal movement fit isometric tiles.
	motion.y /= 2
	
	velocity = motion.normalized() * MOTION_SPEED
	
	move_and_slide()
