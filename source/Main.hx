package;

import haxe.Log;

/**
 * A simple Haxe program to implement Game of Life
 *
 * @author Mihai Alexandru (MAJigsaw77)
 */
class Main
{
	private static final grid:Array<Array<Int>> = [
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	];

	public static function main():Void
	{
		Log.trace('Original Generation');

		for (i in 0...grid.length)
		{
			var buffer:String = '';

			for (j in 0...grid[i].length)
				buffer += grid[i][j] == 0 ? '.' : '*';

			Log.trace(buffer);
		}

		Log.trace('');
	}
}
