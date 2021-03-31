Rails.application.routes.draw do
  resources :tweets
  #  Cambia la url base de /photos a /fotos, manteniendo el resto en el modelo photos y controlador photos
  resources :fotos, as: :photos, controller: :photos

  root to: 'main#hello'

  get 'bienvenida', to: 'main#hi'
  post 'hi', to: 'main#greetings'
end
