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
		plays_at(cross_player, x, y)
	end

	def circle_plays_at(x, y)
		plays_at(circle_player, x, y)
	end

	def circle_tateti?
		tateti? circle_player
	end

	def cross_tateti?
		tateti? cross_player
	end

	private

	def cross_player
		'X'
	end

	def circle_player
		'0'
	end
	
	def tateti?(player)
		count = [0,0,0]
		@posiciones.each_with_index do |line, index|
			line.each do |played_by|
				count[index]+=1 if played_by == player
			end	
		end
		count.include? 3
	end

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
		context "en 1er linea horizontal" do
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
		context "en 2da linea horizontal" do
			it "es tateti para circulo" do
				# X | X | 
				# 0 | 0 | 0
				#   |   | 

				board.circle_plays_at(1,0)
				board.cross_plays_at(0,0)
				board.circle_plays_at(1,1)
				board.cross_plays_at(0,1)
				board.circle_plays_at(1,2)

				board.circle_tateti?.should == true
				board.cross_tateti?.should == false
			end
			it "es tateti para cruz" do
				# 0 | 0 | 
				# X | X | X
				#   |   | 

				board.cross_plays_at(1,0)
				board.circle_plays_at(0,0)
				board.cross_plays_at(1,1)
				board.circle_plays_at(0,1)
				board.cross_plays_at(1,2)

				board.circle_tateti?.should == false
				board.cross_tateti?.should == true
			end			
		end
	end

end