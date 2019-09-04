
class View

  def welcome_message
    puts <<-EOF
         **********************************
         Welcome to your parking administration app, Carl
         **********************************
         EOF
  end

  def help_message
    puts <<-EOF
    "**********************************
    Check In:
    type 'ENTRY {Your Plate number} {your vehicle type (car, motorbike, truck or bus)}'
    Check Out:
    type 'EXIT {Your Plate number}'
    Quit Program:
    Press Ctrl + C
    **********************************"
    EOF
  end

  def get_input
    print ">>> "
    input = gets.chomp
  end

  def display(message)
    puts message
  end
end
