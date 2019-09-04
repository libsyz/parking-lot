# frozen_string_literal: true
# Class to display messages and ask for input

class View
  def welcome_message
    puts <<~WELCOME
      **********************************
      Welcome to your parking administration app, Carl
      **********************************
    WELCOME
  end

  def help_message
    puts <<~HELP
      "**********************************
      Check In:
      type 'ENTRY {Your Plate number} {your vehicle type (car, motorbike, truck or bus)}'
      Check Out:
      type 'EXIT {Your Plate number}'
      Quit Program:
      Press Ctrl + C
      **********************************"
    HELP
  end

  def ask_for_input
    print '>>> '
    gets.chomp
  end

  def display(message)
    puts message
  end
end
