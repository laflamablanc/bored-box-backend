Rails.application.routes.draw do
  resources :user_games
  resources :user_likes
  resources :games
  resources :box_games
  resources :boxes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
