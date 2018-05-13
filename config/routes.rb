Rails.application.routes.draw do
  get 'applications/index'
  resources :institutions
  devise_for :users
  root 'applications#index', as: :authenticated_root
end
