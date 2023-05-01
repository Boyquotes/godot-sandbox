extends Node2D

## Calculate the isometric map coordinates which corresponds to the input grid cell.
##
## Isometric tiles need to convey depth, which means cells in higher orthogonal
## grid layers need to "float". 
func _base_to_render_cell(layer: int, ortho: Vector2i) -> Vector2i:
	# We are treating higher TileMap layers as higher in elevation, which means
	# they should be drawn above the bottom tiles in 3D.
	#
	# This assumes the tile_layout property of the TileSet is DIAMOND_DOWN.
	return Vector2i(ortho.x - layer, ortho.y - layer)


## Calculate the layer and cell which collides with the given local coordinate.
##
## We need to account for cells from higher layers whch are drawn above their
## true position.
func get_layer_and_cell(local: Vector2):
	var cell: Vector2i = $Render/Collider.local_to_map(local)
	for i in range($Base.get_layers_count(), 0, -1):
		var layer := i - 1
		var data : TileData = $Base.get_cell_tile_data(layer, cell)
		if data != null:
			print(data)
			return {
				"layer": layer,
				"cell": Vector2i(cell.x - layer, cell.y - layer),
			}
	return {}
	

## Dynamically generates the Render TileMap.
func _ready():
	$Base.visible = false
	
	for i in range($Base.get_layers_count()):
		$Render.add_layer(i)
		$Render.set_layer_y_sort_enabled(i, true)
		$Render.set_layer_z_index(i, i)

		for c in $Base.get_used_cells(i):
			var atlas = $Base.get_cell_atlas_coords(i, c)
			$Render.set_cell(i, _base_to_render_cell(i, c), $Base.get_cell_source_id(i, c), atlas)
