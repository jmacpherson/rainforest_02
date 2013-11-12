class ProfilesController < ApplicationController
  # load_and_authorize_resource

  def index
  end

  def new
    @profile = current_user.build_profile
    @user = current_user
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to products_path
    else
      render "new"
    end
  end

  def show
    
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :favorite_fruit, :biography, :user_id)  
  end

end
