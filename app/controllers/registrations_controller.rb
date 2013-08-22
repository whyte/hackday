class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    super
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
end