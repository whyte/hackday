class AdminController < ApplicationController
  
  def index
    if current_user.admin?
      @mentors = User.find_all_by_part_type("mentor")
      @youth = User.find_all_by_part_type("youth")
    else
      redirect_to :controller => "home", :action => "index"
    end
  end
  
  def publish
    @user = User.find(params[:id])
    @user.published = true
    if @user.save
      redirect_to :controller => "admin", :action => "index"
    else
      flash[:notice] = "User Failed to Update"
      redirect_to :controller => "admin", :action => "index"
    end  
  end
  
end
