Rails.application.routes.draw do

  root "events#index"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :events do 
    collection do
      match 'search' => "event#search", via: [:get, :post], as: :search
    end
    resources :users, only: [:new, :create]
    resources :trips, only: [:new, :create]
    resources :trees, only: [:new, :create]
    resources :pledges, only: [:new, :create]
  end

  resources :events, only: [:index, :show]


  #things to cache for offline version
  offline = Rack::Offline.configure  do 
    cache ActionController::Base.helpers.asset_path("application.css")
    cache ActionController::Base.helpers.asset_path("bootstrap.css")
    cache ActionController::Base.helpers.asset_path("events.css")
    cache ActionController::Base.helpers.asset_path("pledges.css")
    cache ActionController::Base.helpers.asset_path("responsive.css")
    cache ActionController::Base.helpers.asset_path("trees.css")
    cache ActionController::Base.helpers.asset_path("trip.css")
    cache ActionController::Base.helpers.asset_path("users.css")
    
    cache ActionController::Base.helpers.asset_path("application.js")
    cache ActionController::Base.helpers.asset_path("home.jpg")
    cache ActionController::Base.helpers.asset_path("reliance.png")
    cache ActionController::Base.helpers.asset_path("greenpop.png")
    cache ActionController::Base.helpers.asset_path("couch1.png")
    cache ActionController::Base.helpers.asset_path("car1.png")
    cache ActionController::Base.helpers.asset_path("rails.png")
    cache ActionController::Base.helpers.asset_path("plane1.png")
    cache ActionController::Base.helpers.asset_path("tree1.png")

    network "/"
  end
  get "/application.manifest" => offline
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
