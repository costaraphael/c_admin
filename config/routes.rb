CAdmin::Engine.routes.draw do
  get '/(:_action)', to: 'root#index', as: 'root'
  get '/:model/(:_action)', to: 'colletion#index', as: 'collection'
  get '/:model/:_action/:id', to: 'member#index', as: 'member'
end
