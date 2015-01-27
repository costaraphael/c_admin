CAdmin::Engine.routes.draw do
  match '/(:_action)', to: 'root#index', as: 'root', via: :all
  match '/:model/(:_action)', to: 'colletion#index', as: 'collection', via: :all
  match '/:model/:_action/:id', to: 'member#index', as: 'member', via: :all
end
