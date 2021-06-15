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

  def default_meta_tags
    {
      site: "heroku.com",
      title: "Ethio-cars",
      reverse: true,
      separator: "|",
      description: "Created a desktop-only app where a user can sign up and/or sign in, select categories, and upload vehicle images with specifications. ",
      keywords: "business",
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url("ethio_cars3.png") },
        { href: image_url("ethio_cars3.png"), rel: "apple-touch-icon", sizes: "180x180", type: "image/jpg" },
      ],
      og: {
        site_name: "MyMovies.dev",
        title: "Ethio-cars",
        description: "Created a desktop-only app where a user can sign up and/or sign in, select categories, and upload vehicle images with specifications. ",
        type: "website",
        url: request.original_url,
        image: image_url("ethio_cars3.png"),
      },
    }
  end
end
