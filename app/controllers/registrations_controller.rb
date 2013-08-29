class RegistrationsController < Devise::RegistrationsController
  
  def new
    if params[:part_type]
      session["sign_up_type"] = params[:part_type]
    end
    
    @skills = Skill.all
    super
  end

  def create
    @skills = Skill.all
    super
    unless params[:skills].blank?
      params[:skills].each do |s|
        skill = Skill.find_by_id(s)
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