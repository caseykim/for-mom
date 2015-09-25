Rails.application.routes.draw do
  root 'bday_messages#index'
  resources :bday_messages
end
