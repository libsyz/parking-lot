require_relative 'validator'
require_relative 'request'
require_relative 'router'
require_relative 'entries_controller'
require_relative 'parking_lot'
require_relative 'floor'
require_relative 'lot'


validator = Validator.new
parking_lot = ParkingLot.new
# entries_controller = EntriesController.new(parking_lot)
# exits_controller = ExitsController.new

floor_first = Floor.new({vehicles_allowed: ["truck", "bus"], max_lots: 15})
floor_second = Floor.new({vehicles_allowed: ["motorbike", "car"], max_lots: 15})
floor_third = Floor.new({vehicles_allowed: ["motorbike", "car"], max_lots: 15})

all_floors = [floor_first, floor_second, floor_third]

counter = 0
all_floors.each do |floor|
  floor.max_lots.times do
    floor.lots << Lot.new(counter)
    counter += 1
  end
end

# router = Router.new(entries_controller, exits_controller)

# help_text =
#             "Entry:
#             type 'ENTRY {Your Plate number} {your vehicle type (car, motorbike, truck or bus)}'
#             Exit:
#             type 'EXIT {Your Plate number}'"

# loop do
#   print ">>> "
#   input = gets.chomp
#   clean_input = validator.validate(input)
#   request = Request.new(clean_input)
#   router.handle(request)
# end

