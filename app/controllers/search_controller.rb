class SearchController < ApplicationController

  def show    
    if current_user
      if User.find(params[:id]).published? || current_user.admin?
        @user = User.find(params[:id])
      else  
        redirect_to :controller => "home", :action => "index"
      end      
    else      
      if User.find(params[:id]).published?  
        @user = User.find(params[:id])
      else  
        redirect_to :controller => "home", :action => "index"
      end
    end  
  end
  

end
