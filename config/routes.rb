Rails.application.routes.draw do
  root to: 'application#home'
  get 'delivery_cost', to: 'application#delivery_cost'
  post 'hide', to: 'products#hide'
  get 'add_component', to: 'products#add_component'
  get 'remove_component', to: 'products#remove_component'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end