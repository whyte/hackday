class AdminController < ApplicationController
  
  def index
    if current_user.admin?
      @mentors = User.find_all_by_part_type("mentor")
      @youth = User.find_all_by_part_type("youth")
      @total_committed_mentors = User.where(:part_type => "mentor", :published => true).count
      @total_committed_youth = User.where(:part_type => "youth", :published => true).count
      @total_potential_mentors = User.where(:part_type => "mentor", :published => nil).count
      @total_potential_youth = User.where(:part_type => "youth", :published => nil).count
      @total_mentors = User.where(:part_type => "mentor").count
      @total_youth = User.where(:part_type => "youth").count
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
