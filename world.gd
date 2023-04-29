extends Node2D

var t = Transform2D(
	Vector2(0.5, 0.25),  # X'
	Vector2(-0.5, 0.25),  # Y'
	Vector2(16, -8),  # O'
)

var u = Transform2D(
	Vector2(2, 0),
	Vector2(0, 2),
	Vector2(1, 1),
)
func _ready():
	print(u * Vector2(0, 0))
	print(u * Vector2(1, 0))
	print(u * Vector2(0, 1))

	print(t * Vector2(0, 0))
	print(t * Vector2(32, 0))
	print(t * Vector2(0, 32))
	pass # Replace with function body.


func _process(_delta):
	# TODO(minkezhang): Create a TileMap signal and pass this "set_target" to look up the appropriate cell.
	if Input.is_action_just_released("select"):
		var l := $Terrain/Layout
		var r := $Terrain/Render

		var cell: Vector2 = r.local_to_map(r.to_local(get_global_mouse_position()))
		var target := to_global(l.map_to_local(cell))

		$tank.target = target
		$tank/Sprite2D.position = t * $tank.position
