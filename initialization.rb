# frozen_string_literal: true

require_relative 'parking_lot'
require_relative 'floor'
require_relative 'lot'
require_relative 'validator'
require_relative 'view'
require_relative 'request'
require_relative 'router'
require_relative 'entries_controller'
require_relative 'exits_controller'
require_relative 'app.rb'
require 'pry-byebug'

## Initialization file that gets the app configured and started ##

# Generate floors and lots

floor_first = Floor.new(vehicles_allowed: %w[truck bus],
                        max_lots: 15,
                        number: 1)
floor_second = Floor.new(vehicles_allowed: %w[motorbike car],
                         max_lots: 15,
                         number: 2)
floor_third = Floor.new(vehicles_allowed: %w[motorbike car],
                        max_lots: 15,
                        number: 3)

all_floors = [floor_first, floor_second, floor_third]

distance_from_entry = 0
all_floors.each do |floor|
  floor.max_lots.times do
    floor.lots << Lot.new(distance_from_entry, floor)
    distance_from_entry += 1
  end
end

# Generate Parking and load busy lots
parking_lot = ParkingLot.new(all_floors)
parking_lot.load_csv

# Generate routers and handlers
view = View.new
entries_controller = EntriesController.new(parking_lot)
exits_controller = ExitsController.new(parking_lot)
router = Router.new(view, entries_controller, exits_controller)

# Bundle the app and run
app = App.new(router)
app.run
