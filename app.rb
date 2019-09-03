require_relative 'parking_lot'
require_relative 'floor'
require_relative 'lot'
require_relative 'validator'
require_relative 'request'
require_relative 'router'
require_relative 'entries_controller'
require_relative 'exits_controller'
require 'pry-byebug'


# Generate floors and lots

floor_first = Floor.new({vehicles_allowed: ["truck", "bus"], max_lots: 15, number: 1})
floor_second = Floor.new({vehicles_allowed: ["motorbike", "car"], max_lots: 15, number: 2})
floor_third = Floor.new({vehicles_allowed: ["motorbike", "car"], max_lots: 15, number: 3})

all_floors = [floor_first, floor_second, floor_third]

distance_from_entry = 0
all_floors.each do |floor|
  floor.max_lots.times do
    floor.lots << Lot.new(distance_from_entry, floor)
    distance_from_entry += 1
  end
end


# Generate Parking
parking_lot = ParkingLot.new(all_floors)
parking_lot.load_csv
binding.pry
# Generate routers and handlers

entries_controller = EntriesController.new(parking_lot)
exits_controller = ExitsController.new(parking_lot)
router = Router.new(entries_controller, exits_controller)

validator = Validator.new


welcome_text = <<-EOF
**********************************
Welcome to your parking administration app, Carl
**********************************
            EOF


help_text = <<-EOF
**********************************
Entry:
type 'ENTRY {Your Plate number} {your vehicle type (car, motorbike, truck or bus)}'
Exit:
type 'EXIT {Your Plate number}'"
**********************************
            EOF

puts welcome_text

loop do
  print ">>> "
  input = gets.chomp
  clean_input = validator.validate(input)
  if clean_input
    request = Request.new(clean_input)
    router.handle(request)
  else
    puts help_text
  end
end

