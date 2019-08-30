
class Validator
  PLATE_REGEXP = /[A-Z]{2}\d{2}[A-Z]{4}/
  VEHICLES = ["car", "truck", "bus", "motorbike"]

  def validate(input)
    @input = input.strip.split(" ")
    if entry_input? || exit_input?
      request_params
    else
      input_invalid
    end
  end

  def entry_input?
    @input.size == 3 &&
    @input[0] == "ENTRY" &&
    @input[1] =~ PLATE_REGEXP &&
    VEHICLES.any? {|el| el == @input[2] }
  end

  def exit_input?
    @input.size == 2 &&
    @input.first == "EXIT" &&
    @input[1] =~ PLATE_REGEXP
  end

  def input_invalid
    puts "Sorry, I could not make sense of your input!"
  end

  def request_params
    {
      action: @input[0],
      plate: @input.find(PLATE_REGEXP),
      vehicle: @input.find(PLATE_REGEXP)
    }
  end

end


