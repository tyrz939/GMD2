draw_set_alpha(image_alpha)
draw_set_color(image_blend)
switch grid[| 0] {
	case drawDepth.SPRITE:
		draw_image(grid[| 1], grid[| 2], x, y);
		break;
	case drawDepth.EXT:
		draw_image_ext(grid[| 1], grid[| 2], x, y, grid[| 5], grid[| 6], grid[| 7], image_blend, image_alpha);
		break;
	case drawDepth.POS:
		draw_image_pos(grid[| 1], grid[| 2], grid[| 3], grid[| 4], grid[| 5], grid[| 6], grid[| 7], grid[| 8], grid[| 9], grid[| 10], image_alpha);
		break;
	case drawDepth.STRETCHED:
		draw_image_stretched(grid[| 1], grid[| 2], x, y, grid[| 5], grid[| 6]);
		break;
	case drawDepth.STRETCHED_EXT:
		draw_image_stretched_ext(grid[| 1], grid[| 2], x, y, grid[| 5], grid[| 6], image_blend, image_alpha);
		break;
	case drawDepth.PART:
		draw_image_part(grid[| 1], grid[| 2], grid[| 3], grid[| 4], grid[| 5], grid[| 6], x, y);
		break;
	case drawDepth.PART_EXT:
		draw_image_part_ext(grid[| 1], grid[| 2], grid[| 3], grid[| 4], grid[| 5], grid[| 6], x, y, grid[| 9], grid[| 10], image_blend, image_alpha);
		break;
}
draw_set_alpha(1)
draw_set_color(c_white)