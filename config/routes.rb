Rails.application.routes.draw do
  root 'homes#index'
  resources :bday_messages
  resources :gifts

  post '/most-wanted', to: 'gifts#most_wanted'
end
