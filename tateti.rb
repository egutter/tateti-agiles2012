class Tateti
	def new_game
		@board = [[],[],[]]
	end

	def cols
		3
	end

	def rows
		3
	end

	def empty?
		true
	end

	def play figure, row, col
		@board[row][col] = figure if row < 4 and col < 4
	end

	def value_at row, col
		return nil if @board[row].nil?
		@board[row][col]
	end
end