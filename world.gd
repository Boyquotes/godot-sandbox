extends Node2D

var t = Transform2D(
	Vector2(0.5, 0.25),  # X'
	Vector2(-0.5, 0.25),  # Y'
	Vector2(16, -8),  # O'
)

@onready
var l := $Terrain/Layout

@onready
var r := $Terrain/Render


func _process(_delta):
	# TODO(minkezhang): Create a TileMap signal and pass this "set_target" to look up the appropriate cell.
	if Input.is_action_just_released("select"):
		var l := $Terrain/Layout
		var r := $Terrain/Render

		var click_position := get_global_mouse_position()
		click_position.y += 8

		var cell: Vector2 = r.local_to_map(r.to_local(click_position))
		var target := to_global(l.map_to_local(cell))
		
		print("clicked = ", click_position, "; local = ", r.to_local(click_position), "; cell = ", cell, "; global target = ", target)

		$Tank/Character2D.target = target

		# $Tank/Sprite2D.position = t * $Tank/Character2D.position
