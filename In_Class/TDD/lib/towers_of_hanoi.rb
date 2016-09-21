class TowersHanoi
  attr_reader :towers

  def initialize(tower = [[3,2,1],[],[]])
    @towers = tower
  end

  def get_input
    print "Please enter a move in x,y format: "
    move = gets.chomp
    move.split(",").map {|x| x.to_i}
  end

  def play
    until won?
      input = get_input
      move(*input)
    end
    print "You win!"
  end

  def move(from_tower,to_tower)
    raise "invalid move" unless valid_move?(from_tower, to_tower)

    disk = @towers[from_tower].pop
    @towers[to_tower].push(disk)

  end

  def won?
    ( @towers[1].length == 3 || @towers[2].length == 3) ? true : false
  end

  private
  attr_writer :towers

  def valid_move?(from_tower,to_tower)
    return false if @towers[from_tower].empty?
    return false if (!@towers[to_tower].empty? && @towers[from_tower].last > @towers[to_tower].last)
    return false if !(from_tower.between?(0,2) && to_tower.between?(0,2))

    true
  end

end
