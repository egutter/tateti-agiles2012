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
		tateti_line?(circle_player) || tateti_col?(circle_player)
	end

	def cross_tateti?
		tateti_line?(cross_player) || tateti_col?(cross_player)
	end

	private

	def cross_player
		'X'
	end

	def circle_player
		'0'
	end
	
	def tateti_line?(player)
		count = [0,0,0]
		@posiciones.each_with_index do |line, index|
			line.each do |played_by|
				count[index]+=1 if played_by == player
			end	
		end
		count.include? 3
	end
	def tateti_col?(player)
		count = [0,0,0]
		(0..2).each do |col_num|
			@posiciones.each_with_index do |line, index|			
				count[col_num]+=1 if line[col_num] == player
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
		[0, 1].each do |linea|
			context "en linea nro #{linea}" do
				it "es tateti para circulo" do
					# 0 | 0 | 0
					# X | X | 
					#   |   | 

					board.circle_plays_at(linea,0)
					board.cross_plays_at(linea+1,0)
					board.circle_plays_at(linea,1)
					board.cross_plays_at(linea+1,1)
					board.circle_plays_at(linea,2)

					board.circle_tateti?.should == true
					board.cross_tateti?.should == false
				end
				it "es tateti para cruz" do
					# X | X | X
					# 0 | 0 | 
					#   |   | 

					board.cross_plays_at(linea,0)
					board.circle_plays_at(linea+1,0)
					board.cross_plays_at(linea,1)
					board.circle_plays_at(linea+1,1)
					board.cross_plays_at(linea,2)

					board.circle_tateti?.should == false
					board.cross_tateti?.should == true
				end			
			end
		end		
		[0, 1].each do |columna|
			context "en columna nro #{columna}" do
				it "es tateti para circulo" do
					# 0 | X | 
					# 0 | X | 
					# 0 |   | 

					board.circle_plays_at(0, columna)
					board.cross_plays_at(0, columna+1)
					board.circle_plays_at(1, columna)
					board.cross_plays_at(1,columna+1)
					board.circle_plays_at(2, columna)

					board.circle_tateti?.should == true
					board.cross_tateti?.should == false
				end
				it "es tateti para cruz" do
					# X | 0 | 
					# X | 0 | 
					# X |   | 

					board.cross_plays_at(0,columna)
					board.circle_plays_at(0, columna+1)
					board.cross_plays_at(1,columna)
					board.circle_plays_at(1,columna+1)
					board.cross_plays_at(2,columna)

					board.circle_tateti?.should == false
					board.cross_tateti?.should == true
				end			
			end
		end
	end

end