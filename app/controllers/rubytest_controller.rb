class RubytestController < ApplicationController
  
  def index
    #board.enableServo
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
  
  def refreshSnapshot
    image = Snapshot.last
    @snapshot = image.filename
    @snapshot.slice! "/home/graduate/Aptana Workspace/Test/app/assets/images/snapshots/"
    render :partial => "rubytest/refreshSnapshot"
  end
  
  def cameraOps
    @status = "No change."
    pid = system("pidof motion")
    if pid
      destroy = system("kill $(pidof motion)")
      
      if destroy
        @status = "Motion destroyed."
      end
    else
      start = system("motion")
      @status = "Motion started."
    end
    
    respond_to do | format |
        format.html   { redirect_to index_path }
        format.js { @status }
    end
    
  end
  
end
