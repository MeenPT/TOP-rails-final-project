class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit ]

  def show
    @is_owner = @profile.user == current_user
  end

  def edit
    if @profile.user != current_user
      redirect_to root_path, alert: "Unauthorized access."
    end
  end

  private
   def set_profile
    @profile = Profile.find(params[:id])
   end
end
