class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vehicle.votes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @vehicle }

      format.js
    end
  end

  def destroy
    @vehicle.votes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @vehicle }

      format.js
    end
  end

  private

  def set_post
    @vehicle = Vehicle.find(params[:post_id])
  end
end
