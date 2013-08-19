class HomeController < ApplicationController
  def index
    @header_title = "Girls Do Hack"
    @header_text = " is designed to emphasize to young women that STEM careers are an option for their futures. On November 9th 2013, teams of girls will work with women in science, technology, engineering and math careers at the Adler Planetarium."
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
