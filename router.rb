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

  def handle(request)
    if request.is_entry?
      response = @entries_controller.process(request)
      @view.display(response)
    elsif request.is_exit?
      response = @exits_controller.process(request)
      @view.display(response)
    else
      error = "Sorry! Something went wrong"
      @view.display(error)
    end
  end
end

