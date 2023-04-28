extends CharacterBody2D

@export var target: Vector2
@export var speed: float = 48

func _physics_process(_delta):
	var dv = (target - position).normalized() * speed
	dv.y /= 2  # Account for isometric geometry.
	
	velocity = dv
	
	move_and_slide()
