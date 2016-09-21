require 'towers_of_hanoi'
require 'rspec'


describe TowersHanoi do
  subject(:hanoi) { TowersHanoi.new }
  describe "#initialize" do
    it "should initialize with three arrays" do
      expect(hanoi.towers).to be_a(Array)
    end
    it "should have one full left tower" do
      expect(hanoi.towers[0]).to eq([3,2,1])
      expect(hanoi.towers[1]).to be_empty
      expect(hanoi.towers[2]).to be_empty
    end
  end

  describe "#move" do
    before(:each) {hanoi.move(0,1)}
    it "should remove an element from the selected tower" do
      expect(hanoi.towers[0]).to eq([3,2])
    end
    it "should add an element to the selected tower" do
      expect(hanoi.towers[1]).to eq([1])
    end

    it "should raise 'invalid move' if move is not valid" do
      expect{hanoi.move(2,1)}.to raise_error("invalid move")
      expect{hanoi.move(2,5)}.to raise_error("invalid move")
      expect{hanoi.move(0,1)}.to raise_error("invalid move")
    end
  end

  describe "#won?" do
    before(:each) do
      hanoi.move(0,1)
      hanoi.move(0,2)
      hanoi.move(1,2)
      hanoi.move(0,1)
      hanoi.move(2,0)
      hanoi.move(2,1)
      hanoi.move(0,1)
    end

    it "should have [3,2,1] on a different tower" do
      expect(hanoi.towers[1]).to eq([3,2,1])
    end



    it "should return true if game is over" do
      expect(hanoi.won?).to be true
    end
  end
end
