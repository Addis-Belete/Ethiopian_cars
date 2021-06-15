module ApplicationHelper
  def like(vehicle)
    user_signed_in?
    if vehicle.voted?(current_user)
      button_to 'Unlike', unvote_path(@vehicle), method: 'put'
    else
      button_to 'Like', vote_path(@vehicle), method: 'put'
    end
  end

  def edit_back
    if current_user.id == @vehicle.user_id
      (link_to 'Edit |', edit_vehicle_path(@vehicle)) + (link_to ' Back', vehicles_path)
    else
      link_to 'Back', vehicles_path
    end
  end

  def default_meta_tags
    {
      site: 'MyMovies.dev',
      title: 'MyMovies',
      reverse: true,
      separator: '|',
      description: 'The most popular movie website in the world',
      keywords: 'action, horror, drama',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('ethio_cars3.png') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: 'MyMovies.dev',
        title: 'MyMovies',
        description: 'The most popular movie website in the world',
        type: 'website',
        url: request.original_url,
        image: image_url('ethio_cars3.png')
      }
    }
  end
end
