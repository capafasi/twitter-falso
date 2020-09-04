Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  resources :tweets do
    post 'likes', to: 'tweets#likes'
    post 'retweet', to: 'tweets#retweet'
  end
    
  root 'pages#index'
  get 'pages/all_tweets'
  devise_for :users

  #get "users#follow"
  post "follow/:user_id", to: 'users#follow', as: 'users_follow'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
