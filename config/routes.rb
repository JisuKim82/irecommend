Rails.application.routes.draw do
  resources :books
  root "books#index"

  get '/login' => "sessions#login"
  get '/new' => "sessions#new"
  post '/sessions' => "sessions#create"
end
