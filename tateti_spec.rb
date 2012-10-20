class Board

	def initialize
		@empty = true
		@posiciones = [[]]
	end

	def empty?
		@empty
	end

	def cross_plays_at(x, y)
		raise PosicionOcupadaError.new('el lugar esta ocupado') unless @posiciones[x][y].nil?
		@empty = false
		@posiciones[x][y] = 'X'
	end

	def circle_plays_at(x, y)
		raise PosicionOcupadaError.new('el lugar esta ocupado') unless @posiciones[x][y].nil?
		@posiciones[x][y] = '0'		
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

	context "no se puede jugar en el mismo lugar" do
		it "circulo no puede jugar donde jugo cruz" do
			board.cross_plays_at(0,0)
			expect {
				board.circle_plays_at(0,0)
			}.to raise_error(PosicionOcupadaError)
		end

		it "cruz no puede jugar donde jugo circulo" do
			board.circle_plays_at(0,0)
			expect {
				board.cross_plays_at(0,0)
			}.to raise_error(PosicionOcupadaError)
		end

	end

end