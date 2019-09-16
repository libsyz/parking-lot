# frozen_string_literal: true
# parses and validates raw user input

module Validator
  PLATE_REGEXP = /[A-Z]{2}\d{2}[A-Z]{4}/.freeze
  VEHICLES = %w[car truck bus motorbike].freeze

  def validate(input)
    @input = input.strip.split(' ')
    if entry_input? || exit_input?
      request_params
    else
      input_invalid
    end
  end

  private

  def entry_input?
    @input.size == 3 &&
      @input[0] == 'ENTRY' &&
      @input[1] =~ PLATE_REGEXP &&
      VEHICLES.any? { |el| el == @input[2] }
  end

  def exit_input?
    @input.size == 2 &&
      @input.first == 'EXIT' &&
      @input[1] =~ PLATE_REGEXP
  end

  def input_invalid
    'Sorry, I could not make sense of your input!'
  end

  def request_params
    {
      action: @input[0],
      vehicle: @input.find { |el| VEHICLES.include?(el) },
      plate: @input.find { |el| el =~ PLATE_REGEXP }
    }
  end

end
