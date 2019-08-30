require_relative 'validator'
require_relative 'request'

validator = Validator.new

help_text = "We got an error!"

loop do
  print ">>> "
  input = gets.chomp
  clean_input = validator.validate(input)
  request = Request.new(clean_input)

  if request.is_entry?
    EntriesController.process(request)
  elsif request.is_exit?
    ExitsControllers.process(request)
  end

rescue
  puts "Entry: \n
        type 'ENTRY {Your Plate number} {your vehicle type (car, motorbike, truck or bus)}' \n
        Exit:
        type 'EXIT {Your Plate number}'' \n"
end

