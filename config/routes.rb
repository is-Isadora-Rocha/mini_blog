Rails.application.routes.draw do
  # get 'home/index'
  root 'home#index'
  # página inicial = controler # ação do controller
  resources :posts
end
