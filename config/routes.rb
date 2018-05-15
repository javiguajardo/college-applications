Rails.application.routes.draw do
  resources :students
  get 'applications/index'
  resources :institutions
  devise_for :users
  root 'applications#index', as: :authenticated_root
end
