# frozen_string_literal: true
# Floor is part of the parking lot
# Parking -> Floors -> Lots

class Floor
  attr_reader :capacity, :vehicle_types, :number, :lots

  def initialize(config = {})
    @lots = []
    @vehicle_types = config[:vehicle_types]
    @capacity = config[:capacity]
    @number = config[:number]
    raise "capacity must be present on initialization params" unless capacity
  end

  def space_available?
    lots.any?(&:free?)
  end

  def full?
    lots.compact.count == capacity
  end

  def lots=(array)
    if array.size <= capacity
      @lots = array
    else
      raise "can't exceed the Floor's capacity"
    end
  end
end
