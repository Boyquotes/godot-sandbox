extends Node2D


func _ready():
	pass # Replace with function body.


func _process(delta):
	# TODO(minkezhang): Create a TileMap signal and pass this "set_target" to look up the appropriate cell.
	if Input.is_action_just_released("select"):
		$tank.target = get_global_mouse_position()
