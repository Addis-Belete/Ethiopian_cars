module ApplicationHelper
  def like(vehicle)
    user_signed_in?
    if vehicle.voted?(current_user)
      button_to "Unlike", unvote_path(@vehicle), method: "put"
    else
      button_to "Like", vote_path(@vehicle), method: "put"
    end
  end
end
