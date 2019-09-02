class Request
attr_reader :action, :vehicle, :plate

  def initialize(params = {})
    @action = params[:action]
    @vehicle = params[:vehicle]
    @plate = params[:plate]
  end

  def is_entry?
    @action == "ENTRY"
  end

  def is_exit?
    @action == "EXIT"
  end

end
