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

	def circle_plays_at(x, y)
		raise PosicionOcupadaError.new('el lugar esta ocupado')
	end
end

class PosicionOcupadaError < StandardError
end
describe "Tateti" do

	subject :board do
		Board.new
	end

	it "un nuevo tablero debe estar vacio" do
		board.empty?.should == true
	end

	it "un tablero con una jugada no deberia estar vacio" do
		board.cross_plays_at(0,0)
		board.empty?.should == false
	end

	it "no se puede jugar en el mismo lugar" do
		board.cross_plays_at(0,0)
		expect {
			board.circle_plays_at(0,0)
		}.to raise_error(PosicionOcupadaError)
	end
end