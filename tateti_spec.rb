class Board

	def initialize
		@empty = true
		@posiciones = [[], [], []]
	end

	def empty?
		@empty
	end

	def cross_plays_at(x, y)
		@empty = false
		plays_at('X', x, y)
	end

	def circle_plays_at(x, y)
		plays_at('0', x, y)
	end

	def circle_tateti?
		circle = 0
		@posiciones[0].each do |player|
			circle+=1 if player == '0'
		end	
		circle == 3
	end

	def cross_tateti?
		cross = 0
		@posiciones[0].each do |player|
			cross+=1 if player == 'X'
		end	
		cross == 3
	end

	private

	def plays_at(player, x, y)
		raise PosicionOcupadaError.new('el lugar esta ocupado') unless @posiciones[x][y].nil?
		@posiciones[x][y] = player		
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

	context "ta-te-ti" do
		context "en linea horizontal" do
			it "es tateti para circulo" do
				# 0 | 0 | 0
				# X | X | 
				#   |   | 

				board.circle_plays_at(0,0)
				board.cross_plays_at(1,0)
				board.circle_plays_at(0,1)
				board.cross_plays_at(1,1)
				board.circle_plays_at(0,2)

				board.circle_tateti?.should == true
				board.cross_tateti?.should == false
			end
			it "es tateti para cruz" do
				# X | X | X
				# 0 | 0 | 
				#   |   | 

				board.cross_plays_at(0,0)
				board.circle_plays_at(1,0)
				board.cross_plays_at(0,1)
				board.circle_plays_at(1,1)
				board.cross_plays_at(0,2)

				board.circle_tateti?.should == false
				board.cross_tateti?.should == true
			end			
		end
	end

end