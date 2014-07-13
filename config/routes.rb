Rails.application.routes.draw do
  resources :books
  root "books#index"

  get '/login' => "sessions#new"
  get '/logout' => "sessions#destroy"
  post '/sessions' => "sessions#create"
end
