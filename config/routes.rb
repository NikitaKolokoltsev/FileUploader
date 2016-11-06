Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  resources :users do
  	resources :attachments
  end

  resources :attachments, only: [:download] do
  	get "/download", to: "attachments#download"
  end
end
