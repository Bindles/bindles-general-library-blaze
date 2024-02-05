Rails.application.routes.draw do
  #resources :items
  resources :posts, only: :index
  root "posts#index"
  get 'items' => 'items#index'
  get 'items/:id' => 'items#show', as: 'item'
end
