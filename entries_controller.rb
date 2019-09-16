# frozen_string_literal: true
# handles logic for vehicle entries

require 'csv'

class EntriesController
  def initialize(parking_lot)
    @parking = parking_lot
  end

  def process(request)
    return duplicated_plate if @parking.holds?(request)
    return no_spots_left unless @parking.space_available?
    @parking.store(request)
  end

  def duplicated_plate
    'Vehicle plate already checked in the parking'
  end

  def no_spots_left
    'Sorry! There are no spaces left - Check out a bus to continue'
  end
end
