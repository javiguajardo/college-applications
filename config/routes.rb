Rails.application.routes.draw do
  resources :institutions
  devise_for :users
end
