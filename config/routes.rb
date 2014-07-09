Fifa::Application.routes.draw do

  root 'groups#index'

  resources :groups, only: [:index, :show, :create, :new]
  resources :memberships, only: [:create]

  devise_for :users

end
