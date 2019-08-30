
class Validator
  PLATE_REGEXP = /[A-Z]{2}\d{2}[A-Z]{4}/
  VEHICLES = ["car", "truck", "bus", "motorbike"]

  def validate(input)
    @input = input.strip.split(" ")
    if entry_input?

    elsif exit_input?

    else
      input_invalid
    end
  end

  def entry_input?
    @input.size == 3 &&
    @input.first == "ENTRY" &&
    VEHICLES.any? {|el| el == @input.second } &&
    @input.third =~ PLATE_REGEXP
  end

  def exit_input?
    false
  end

  def exit_params?
    @params.size == 2 &&
    @params.first == "EXIT" &&
    @params.second =~ PLATE_REGEXP
  end

  def entry_params
    if input.first == "ENTRY"
      {
        action: @input.first,
        plate: @input.find,
        vehicle: @input.third
      }
    elsif
      {
        action: @input.first,
        plate: @input.second
      }
    end
  end
  def input_invalid
    puts "Sorry, I could not make sense of your input!"
  end

end


