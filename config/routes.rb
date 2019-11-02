Rails.application.routes.draw do
  root to: 'application#home'
  get 'delivery_cost', to: 'application#delivery_cost'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
