Rails.application.routes.draw do

  

  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      resources :users
      resources :user_games
      resources :user_likes
      resources :games
      resources :box_games
      resources :boxes

    end
  end
end


# Rails.application.routes.draw do
#   resources :user_games
#   resources :user_likes
#   resources :games
#   resources :box_games
#   resources :boxes

#   get "/login", to: 'users#login', as: "login"
#   post "/login", to: 'users#handle_login'

#   namespace :api do
#     namespace :v1 do

#       resources :users
#     end
#   end
# end
