for(var i = 0; i < ds_grid_height(grid); i++) {
	if grid[# 1, i] > 0 {
		instance_activate_object(grid[# 0, i])
		with grid[# 0, i] {
			instance_destroy()
		}
	}
}

ds_grid_destroy(grid)
ds_grid_destroy(lasers)