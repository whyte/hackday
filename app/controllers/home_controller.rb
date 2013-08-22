class HomeController < ApplicationController
  def index
    @pagetitle = "Home"
    @youth = User.where(part_type: 'youth').all.shuffle[0..4]
    @mentors = User.where(part_type: 'mentor').all.shuffle[0..4]
    #@host = Organization.find_by_org_type("host")
    #@partners = Organization.find_by_org_type("partner")
  end
  
  def show_user
    @participant = current_user
  end
  
end
