require 'array'
require 'rspec'


describe Array do
  subject(:array) { Array.new }
  describe "#my_uniq" do
    let(:duplicates) { [1,1,2,2,3] }
    it "should return an array" do
      expect(duplicates.my_uniq).to be_a(Array)
    end
    it "should return only unique values" do
      expect(duplicates.my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    let(:arr) {[-1,0,2,-2,1]}
    it "should return an array" do
      expect(arr.two_sum).to be_a(Array)
    end

    it "should return pairs of indexes in order" do
      expect(arr.two_sum).to eq([[0,4],[2,3]])
    end

    it "should not have duplicate indexes" do
      expect(arr.two_sum).not_to eql([[0,4],[2,3],[3,2],[4,0]])
    end
  end


  describe "#my_transpose" do
    let(:rows) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ]}
    let(:cols) {[
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]}
  it "should return an array" do
    expect(rows.my_transpose).to be_a(Array)
  end

  it "should return an multi-d array" do
    flag = true
    rows.each do |el|
      flag = false unless el.is_a?(Array)
    end
    expect(flag).to be true
  end

  it "should return rows as columns" do
    expect(rows.my_transpose).to eq(cols)
  end
end #end of array

  describe "#stock_picker" do
    let(:stocks) { [50,75,92,46,80] }
    it "should raise NoMethodError if argument is not array" do
      expect{stock_picker(5)}.to raise_error(NoMethodError)
    end
    it "should return an array" do
      expect(stock_picker(stocks)).to be_a(Array)
    end

    it "returns elements x,y in ascending order" do
      expect(stock_picker(stocks)).to eq([0,2])
    end

    it "should raise error if argument is length" do
      expect{stock_picker([5])}.to raise_error("not enough days")
    end
  end


end #end of Rspec
