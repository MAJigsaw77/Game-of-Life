package;

import haxe.Log;

/**
 * A simple Haxe program to implement Game of Life
 *
 * @author Mihai Alexandru (MAJigsaw77)
 */
class Main
{
	private static final M:Int = 10;
	private static final N:Int = 10;

	private static final grid:Array<Array<Int>> = [
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0, 0, 0],
		[0, 0, 1, 1, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
		[0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	];

	public static function main():Void
	{
		Log.trace('Original Generation\n');

		for (i in 0...M - 1)
		{
			var buffer:StringBuf = new StringBuf();

			for (j in 0...N - 1)
				buffer.add(grid[i][j] == 0 ? '.' : '*');

			Log.trace(buffer.toString());
		}

		Log.trace('');

		var future:Array<Array<Int>> = [
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		];

		// Loop through every cell
		for (l in 0...M - 1)
		{
			for (m in 0...N - 1)
			{
				// Finding no of Neighbours that are alive

				var aliveNeighbours:Int = 0;

				for (i in -1...1)
				{
					for (j in -1...1)
					{
						if ((l + i >= 0 && l + i < M) && (m + j >= 0 && m + j < N))
							aliveNeighbours += grid[l + i][m + j];
					}
				}

				// The cell needs to be subtracted from
				// its neighbours as it was counted before
				aliveNeighbours -= grid[l][m];

				// Implementing the Rules of Life
				if ((grid[l][m] == 1) && (aliveNeighbours < 2))
					future[l][m] = 0; // Cell is lonely and dies
				else if ((grid[l][m] == 1) && (aliveNeighbours > 3))
					future[l][m] = 0; // Cell dies due to over population
				else if ((grid[l][m] == 0) && (aliveNeighbours == 3))
					future[l][m] = 1; // A new cell is born
				else
					future[l][m] = grid[l][m]; // Remains the same
			}
		}

		Log.trace('Next Generation\n');

		for (i in 0...M - 1)
		{
			var buffer:StringBuf = new StringBuf();

			for (j in 0...N - 1)
				buffer.add(future[i][j] == 0 ? '.' : '*');

			Log.trace(buffer.toString());
		}

		Log.trace('');
	}
}
