describe "Tateti" do

	it "should be an array 3x3" do
		board = [[],[],[]] 
		board.size.should == 3
		board[0].should be_a(Array)
		board[1].should be_a(Array)
		board[2].should be_a(Array)
	end
end