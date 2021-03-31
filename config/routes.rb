Rails.application.routes.draw do
  resources :tweets
  resources :photos

  root to: 'main#hello'

  get 'saludo', to: 'main#hi'
  post 'hi', to: 'main#greetings'
end
