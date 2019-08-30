
class Router
  def initialize(entries_controller, exits_controller)
    @entries_controller = entries_controller
    @exits_controller = exits_controller
  end

  def handle(request)
    puts "at least I got here"
    if request.is_entry?
      puts "Processing entry my man"
    elsif request.is_exit?
      puts "Processing Exit my man"
    else
      puts "Sorry! something went terribly wrong!"
    end
  end
end

