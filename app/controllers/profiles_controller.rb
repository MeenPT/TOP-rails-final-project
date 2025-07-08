class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = Profile.find(params[:id])
    @is_owner = @profile.user == current_user
  end
end
