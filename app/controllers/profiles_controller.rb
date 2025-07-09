class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit update ]

  def show
    @is_owner = @profile.user == current_user
  end

  def edit
    if @profile.user != current_user
      redirect_to root_path, alert: "Unauthorized access."
    end
  end

  def update
    if @profile.user != current_user
      redirect_to root_path, alert: "Unauthorized access."
    end

    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
   def set_profile
    @profile = Profile.find(params[:id])
   end

   def profile_params
     params.expect(profile: [ :bio, :display_name ])
   end
end
