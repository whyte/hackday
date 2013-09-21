class AdminController < ApplicationController
  
  def index
    expiry_time = Time.parse('21 Sept 2013 21:30:00')
    if current_user.admin?
      @mentors = User.where(:part_type => "mentor").where('created_at < ?', expiry_time)
      @youth = User.where(:part_type => "youth")
      @total_committed_mentors = User.where(:part_type => "mentor", :published => true).where('created_at < ?', expiry_time).count
      @total_committed_youth = User.where(:part_type => "youth", :published => true).count
      @total_potential_mentors = User.where(:part_type => "mentor", :published => nil).where('created_at < ?', expiry_time).count
      @total_potential_youth = User.where(:part_type => "youth", :published => nil).count
      @total_mentors = User.where(:part_type => "mentor").where('created_at < ?', expiry_time).count
      @total_youth = User.where(:part_type => "youth").count
      @mentors_post_close = User.where(:part_type => "mentor").where('created_at > ?', expiry_time)
      @mentors_post_close_count = User.where(:part_type => "mentor").where('created_at > ?', expiry_time).count
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
