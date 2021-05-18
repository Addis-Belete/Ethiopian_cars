Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :vehicles
  get "/cars", to: "vehicles#car"
  get "/suvs", to: "vehicles#suv"
  get "/buses", to: "vehicles#bus"
  get "/trucks", to: "vehicles#truck"
  get "/equipments", to: "vehicles#equipment"

  root "vehicles#index"
  put "/vehicle/:id/vote", to: "vehicles#vote", as: "vote"
  put "/vehicle/:id/unvote", to: "vehicles#unvote", as: "unvote"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
