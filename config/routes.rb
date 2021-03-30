Rails.application.routes.draw do
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main#hello'
  get 'photos/index'

  get 'saludo', to: 'main#hi'
  post 'hi', to: 'main#greetings'
end
