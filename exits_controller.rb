# frozen_string_literal: true
# handles logic for vehicle exits

class ExitsController
  def initialize(parking_lot)
    @parking = parking_lot
  end

  def process(request)
    @parking.holds?(request) ? @parking.release_lot(request) : not_found
  end

  def not_found
    'This vehicle plate does not appear to be checked in'
  end
end
