module ApplicationHelper
  def like(vehicle)
    user_signed_in?
    if vehicle.voted?(current_user)
      button_to "Unlike", unvote_path(@vehicle), method: "put"
    else
      button_to "Like", vote_path(@vehicle), method: "put"
    end
  end

  def edit_back
    if current_user.id == @vehicle.user_id
      (link_to "Edit |", edit_vehicle_path(@vehicle)) + (link_to " Back", vehicles_path)
    else
      link_to "Back", vehicles_path
    end
  end
end
