require "tic-tac-toe"

describe Player do
  it "initializes" do
    laura = Player.new("Laura", "X")
    expect(laura.name).to eql("Laura")
    expect(laura.symbol).to eql("X")
  end
end

describe Board do
  describe "#initializes" do
