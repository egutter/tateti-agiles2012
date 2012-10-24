require './tateti'

describe 'tateti' do
	it "should be able to start a new game" do
		board = Tateti.new
		board.respond_to?('new_game').should be_true
	end

end
