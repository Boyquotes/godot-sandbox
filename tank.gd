extends CharacterBody2D

@export var target: Vector2
@export var speed: float = 48


func _physics_process(_delta):
	pass
	var dv = (target - position).normalized() * speed
	velocity = dv
	move_and_slide()
