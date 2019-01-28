require "tic-tac-toe"

describe Player do
  it "initializes" do
    laura = Player.new("Laura", "X")
    expect(laura.name).to eql("Laura")
    expect(laura.symbol).to eql("X")
  end
end

describe Board do
  before do
    @board = Board.new
  end

  describe "#initializes" do
    it "initializes with correct parameters" do
      expect(@board.game_over).to eql(false)
      expect(@board.state).to eql([[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]])
    end
  end

  describe "#make_board" do
    it "makes a blank board" do
      expect(@board.make_board).to eql(" 
       |   |  
    ---|---|---
       |   |  
    ---|---|---
       |   |  
    ")
    end
  end


end
