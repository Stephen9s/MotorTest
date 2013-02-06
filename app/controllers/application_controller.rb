class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :board
  
  def board
    port = '/dev/ttyACM0'
  
  #specify the port as an argument
    @board = Arduino.new(port)
  end
    
end
