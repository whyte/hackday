class HomeController < ApplicationController
  def index
    @pagetitle = "Home"
    @youth = User.find(:all, :order => "id desc", :limit => 5).reverse
    @mentors = User.find(:all, :order => "id desc", :limit => 5).reverse
    #@sponsors = Organization.find_all_by_org_type("sponsor")
    #@host = Organization.find_by_org_type("host")
    #@partners = Organization.find_by_org_type("partner")
  end
  
  def show_user
    @participant = current_user
  end
  
end
