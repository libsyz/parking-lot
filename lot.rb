# frozen_string_literal: true
# Lots are in floors - free updates whether a plate has been assigned or not


class Lot
  attr_reader :plate, :distance_from_entry, :floor

  def initialize(distance_from_entry, floor, plate = nil)
    @plate = plate
    @distance_from_entry = distance_from_entry
    @floor = floor
  end

  def free?
    @plate ? false : true
  end

  def hold(plate)
    @plate = plate
  end

  def release
    @plate = nil
  end
end
