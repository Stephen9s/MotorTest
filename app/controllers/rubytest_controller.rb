class RubytestController < ApplicationController
  
  def index
    board.enableServo
  end
  
  def left
    board.rotateLeft    
    
    respond_to do | format |
        format.html   { redirect_to index_path }
        format.js { }
      end
  end
  
  def right
    board.rotateRight
    
    respond_to do | format |
        format.html   { redirect_to index_path }
        format.js {  }
      end
  end
  
  def close
    board.close
    respond_to do | format |
        format.html   { redirect_to index_path }
        format.js {  }
      end
  end
  
end
