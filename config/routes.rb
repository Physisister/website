Rails.application.routes.draw do

  devise_for :users
  resources :users, :only => [:show]
  get 'home/index'
  get 'home/about_us'
  get 'home/revision'
  resources :articles do
    resources :comments do
      resources :replies
    end
    resources :likes
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
