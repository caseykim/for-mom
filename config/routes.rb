Rails.application.routes.draw do
  root 'gifts#index'
  resources :bday_messages
  resources :gifts

  post '/most-wanted', to: 'gifts#most_wanted'
end
