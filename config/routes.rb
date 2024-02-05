Rails.application.routes.draw do
  resources :pokemons
  resources :movies
  resources :products
  resources :items
  resources :posts, only: :index
  root "products#index"
  get 'fetch_poke' => 'items#fetch_poke'
  get 'test' => 'items#test'
  get 'lp' => 'items#lp'
  get 'mtest' => 'movies#test'
  get 'mlp' => 'movies#lp'
  get 'mlpf' => 'movies#lpf'
end
