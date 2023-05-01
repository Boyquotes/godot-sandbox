extends Node2D


func base_to_render_cell(layer: int, ortho: Vector2i) -> Vector2i:
	# We are treating higher TileMap layers as higher in elevation, which means
	# they should be drawn above the bottom tiles in 3D.
	#
	# This assumes the tile_layout property of the TileSet is DIAMOND_DOWN.
	return Vector2i(ortho.x - layer, ortho.y - layer)


func _ready():
	$Base.visible = false
	
	for i in range($Base.get_layers_count()):
		$Render.add_layer(i)
		$Render.set_layer_y_sort_enabled(i, true)
		$Render.set_layer_z_index(i, i)

		for c in $Base.get_used_cells(i):
			var atlas = $Base.get_cell_atlas_coords(i, c)
			$Render.set_cell(i, base_to_render_cell(i, c), $Base.get_cell_source_id(i, c), atlas)
