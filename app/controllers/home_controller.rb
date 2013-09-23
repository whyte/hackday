class HomeController < ApplicationController
  def index
    @pagetitle = "Home"
    @youth = User.where(:part_type => 'youth', :published => true).all.shuffle[0..4]
    @mentors = User.where(:part_type => 'mentor', :published => true).all.shuffle[0..3]
    #@host = Organization.find_by_org_type("host")
    #@partners = Organization.find_by_org_type("partner")
  end
  
  def youth
    @pagetitle = "All Youth"
    
  end
  
  def mentors
    @pagetitle = "All Mentors"
    @mentors = User.where(:part_type => 'mentor', :published => true)
  end
  
  def sponsor
    @youth = User.where(:part_type => 'youth', :published => true).all.shuffle[0..4]
  end
  
  def speaker
    @youth = User.where(:part_type => 'youth', :published => true).all.shuffle[0..4]
  end
  
  def contact
    @youth = User.where(:part_type => 'youth', :published => true).all.shuffle[0..4]
    @staff = User.where(:part_type => 'staff')
  end
  
  def show_user
    @participant = current_user
  end
  
end
