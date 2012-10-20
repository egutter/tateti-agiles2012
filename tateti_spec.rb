class Board
	def empty?
		true
	end
end
describe "Tateti" do
	it "un nuevo tablero debe estar vacio" do
		Board.new.empty? == true
	end
end