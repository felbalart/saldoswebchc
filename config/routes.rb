Rails.application.routes.draw do
  root to: 'application#home'

  get '/salvoconductos', to: 'salvoconductos#index'
  get '/salvoconductos/new', to: 'salvoconductos#new'
  post '/salvoconductos', to: 'salvoconductos#create'
  get '/salvoconductos/all', to: 'salvoconductos#all'
  get '/salvoconductos/:rut', to: 'salvoconductos#person_show'
  get '/certificado/:rut', to: 'salvoconductos#certificate', as: 'certificado'
  get '/foto', to: 'fotos#image'


  get 'fork', to: 'fork#index'

  get 'encuestas/:full_name', to: 'surveys#new'
  post 'encuestas', to: 'surveys#create'

  get 'delivery_cost', to: 'application#delivery_cost'
  post 'hide', to: 'products#hide'
  get 'add_component', to: 'products#add_component'
  get 'remove_component', to: 'products#remove_component'
  resources :products
  get '/*tag', to: 'products#index', as: 'products_tag'
  post 'substitute', to: 'products#add_substitute'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
