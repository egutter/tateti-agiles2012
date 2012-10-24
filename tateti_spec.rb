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
end
