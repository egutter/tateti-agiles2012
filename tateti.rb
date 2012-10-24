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
		@board[row][col] = figure
	end

	def value_at row, col
		@board[row][col]
	end
end