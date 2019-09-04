# frozen_string_literal: true
# Keeps the program running
# and dispatches requests to controllers

require_relative 'request'
require_relative 'validator'

class Router
  include Validator

  def initialize(view, entries_controller, exits_controller)
    @view = view
    @entries_controller = entries_controller
    @exits_controller = exits_controller
  end

  def start
    loop do
      input = @view.get_input
      clean_input = validate(input)
      if clean_input
        request = Request.new(clean_input)
        handle(request)
      else
        @view.help_message
      end
    end
  end

  def welcome
    @view.welcome_message
  end

  private

  def handle(request)
    if request.entry?
      response = @entries_controller.process(request)
      @view.display(response)
    elsif request.exit?
      response = @exits_controller.process(request)
      @view.display(response)
    end
  end
end
