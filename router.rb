


class Router
  def initialize(entries_controller, exits_controller)
    @entries_controller = entries_controller
    @exits_controller = exits_controller
  end

  def handle(request)
    if request.is_entry?
      response = @entries_controller.process(request)
      puts response
    elsif request.is_exit?
      response = @exits_controller.process(request)
      puts response
    else
      puts "Sorry! something went terribly wrong!"
    end
  end
end

