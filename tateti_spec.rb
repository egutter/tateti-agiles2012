class Board
	def initialize
		@empty = true
	end
	
	def empty?
		@empty
	end
	def cross_plays_at(x, y)
		@empty = false
	end

end

describe "Tateti" do
	it "un nuevo tablero debe estar vacio" do
		Board.new.empty?.should == true
	end
	it "un tablero con una jugada no deberia estar vacio" do
		board = Board.new
		board.cross_plays_at(0,0)
		board.empty?.should == false
	end
end