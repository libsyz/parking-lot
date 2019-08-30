require 'forwardable'

class Rock
  def throw
    puts "throwing rock!"
  end
end


class Goblin
  extend Forwardable
  def_delegators:@rock, :throw

  def initialize(rock)
    @rock = rock
  end
end


goblin = Goblin.new(Rock.new)

