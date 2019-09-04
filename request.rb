# frozen_string_literal: true
# holds vehicle information
# and route activation information

class Request
  attr_reader :action, :vehicle, :plate

  def initialize(params = {})
    @action = params[:action]
    @vehicle = params[:vehicle]
    @plate = params[:plate]
  end

  def entry?
    @action == 'ENTRY'
  end

  def exit?
    @action == 'EXIT'
  end
end
