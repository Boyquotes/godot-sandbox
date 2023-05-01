extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	var ps := [Vector2i(16, 1), Vector2i(32, 8), Vector2i(16, 15), Vector2i(1, 8), Vector2i(16, 8)]
	for p in ps:
		print("DEBUG: p = {p}, iso.local_to_map = {local}".format({
				"p": p,
				"local": local_to_map(p),
			}))
	set_cell(0, Vector2i(0, 0), 0, Vector2i(0, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
