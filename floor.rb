
class Floor
  attr_accessor :lots
  attr_reader :max_lots, :vehicles_allowed, :number

  def initialize(config = {})
    @lots = []
    @vehicles_allowed = config[:vehicles_allowed]
    @max_lots = config[:max_lots]
    @number = config[:number]
  end

  def space_available?
    lots.any? {|lot| lot.free? }
  end

  def full?
    lots.all? {|lot| lot.free? == false }
  end
end
