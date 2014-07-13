Rails.application.routes.draw do
  resources :books
  root "books#index"

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
end
