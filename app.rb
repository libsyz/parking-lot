require_relative 'validator'
require_relative 'request'
require_relative 'router'
require_relative 'entries_controller'
require_relative 'exits_controller'

validator = Validator.new
parking_lot = ParkingLot.new
entries_controller = EntriesController.new(parking_lot)
exits_controller = ExitsController.new

router = Router.new(entries_controller, exits_controller)

help_text =
            "Entry:
            type 'ENTRY {Your Plate number} {your vehicle type (car, motorbike, truck or bus)}'
            Exit:
            type 'EXIT {Your Plate number}'"

loop do
  print ">>> "
  input = gets.chomp
  clean_input = validator.validate(input)
  request = Request.new(clean_input)
  router.handle(request)
end

