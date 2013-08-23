class HomeController < ApplicationController
  def index
    @pagetitle = "Home"
    @youth = User.where(:part_type => 'youth', :published => true).all.shuffle[0..4]
    @mentors = User.where(:part_type => 'mentor', :published => true).all.shuffle[0..4]
    #@host = Organization.find_by_org_type("host")
    #@partners = Organization.find_by_org_type("partner")
  end
  
  def sponsor
    @youth = User.where(:part_type => 'youth', :published => true).all.shuffle[0..4]
  end
  
  def show_user
    @participant = current_user
  end
  
end
