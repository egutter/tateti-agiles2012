require './tateti'

describe 'tateti' do

	before :each do
		@board = Tateti.new
	end

	it "should be able to start a new game" do
		@board.respond_to?('new_game').should be_true
	end

	it "should be 3x3 dimension" do
		@board.cols.should == 3
		@board.rows.should == 3
	end

	it "should be empty when starting a new game" do
		@board.new_game
		@board.empty?.should be_true
	end

	it "should allow play X in 1,1 cell" do
		@board.new_game
		@board.play 'X', 1, 1
		@board.value_at(1,1).should == 'X'
	end

	it "should allow play 0 in 1,1 cell" do
		@board.new_game
		@board.play '0', 1, 1
		@board.value_at(1,1).should == '0'
	end

	it "should not allow playing in col greater than 3" do
		@board.new_game
		@board.play '0', 1, 4
		@board.value_at(1,4).should be nil
	end

	it "should not allow playing in row greater than 3" do
		@board.new_game
		@board.play '0', 4, 1
		@board.value_at(4,1).should be nil
	end
end
