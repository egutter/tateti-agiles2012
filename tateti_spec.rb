require './tateti'

describe 'tateti' do
	it "should be able to start a new game" do
		board = Tateti.new
		board.respond_to?('new_game').should be_true
	end

	it "should be 3x3 dimension" do
		board = Tateti.new
		board.cols.should == 3
		board.rows.should == 3
	end

	it "should be empty when starting a new game" do
		board = Tateti.new
		board.new_game
		board.empty?.should be_true
	end

	it "should allow play X in 1,1 cell" do
		board = Tateti.new
		board.play 'X', 1, 1
		board.value_at(1,1).should == 'X'
	end


end
