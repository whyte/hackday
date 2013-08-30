class RegistrationsController < Devise::RegistrationsController
  
  def new
    if params[:part_type]
      session["sign_up_type"] = params[:part_type]
    end
    super
  end

  def create
    super
    unless params[:additional][:skills] == "Additional, Skills, Listed, Here"
       skills = params[:additional][:skills].split(",").each {|t| t.strip!}
       skills.each do |s|
         skill = Skill.find_or_create_by_value(s) 
         @user.skills << skill
       end
       @user.save
    end   
    unless params[:skills].blank?
      params[:skills].each do |s|
        skill = Skill.find_or_create_by_value(s[0])
        @user.skills << skill
      end
      @user.save
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])      
      if params[:user][:avatar].blank?
        if @user.cropping? 
          @user.avatar.reprocess!
          @user.cropped = 1
          @user.save
        end  
        flash[:notice] = "User Updated"
        redirect_to :action => :edit
      else
        render :action => :edit
      end
    else
      render :action => :edit
    end
  end
  
  protected

  def after_sign_up_path_for(resource)
    edit_user_registration_path(resource)
  end
end