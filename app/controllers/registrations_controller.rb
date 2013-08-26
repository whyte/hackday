class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    super
    # need logic to redirect to either 'mentor' or 'youth' form text depending
    # on where they arrived from.
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