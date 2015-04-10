Taxie::Application.routes.draw do
  resources :car_statuses

  resources :car_types

  resources :favorite_addresses

  resources :reservation_types

  resources :reservation_statuses

  resources :user_types

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :payment_methods

  get "reserve/index"

  get "reservations/historial" => "reservations#historial", as: :reservations_historial

  resources :reservations

  resources :cars

  devise_for :users
  resources :zones

  resources :districts

  #resources :conversations

  root 'pages#home'

  get "nosotros" => "pages#about", as: :about
  get "contacto" => "pages#contact", as: :contact
  get "flota" => "pages#fleet", as: :fleet  


  get "reserva/cancelar/:id" => "reservations#cancelar", as: :reservations_cancelar

  get "reservations/feedback/:id" => "reservations#feedback", as: :reservations_feedback


  get "reservations/asignar/:id" => "reservations#asignar", as: :reservations_asignar
  post "reservations/:id" => "reservations#update2"

  get "micuenta" => "pages#micuenta", as: :micuenta

 


  get "servicios" => "pages#services", as: :services 
  get "cobertura" => "pages#coverage", as: :coverage
  get "tarifa" => "rate#index", as: :rate 
  get "tarifa/ver" => "rate#show", as: :show 

  get "update_zones" => "rate#update_zones", as: :update_zones
  get "update_zones_2" => "rate#update_zones_2", as: :update_zones_2

  get "reserva" => "reserve#index", as: :reserve 
  get "reserva/crear"
  post "reserva/crear" => "reserve#create", as: :reserve_create
  get "favorite_address_select" => "reserve#favorite_address_select", as: :favorite_address_select
  get "calc_rate" => "reserve#calc_rate", as: :calc_rate

  #get 'update_zones', as: 'update_zones'
  

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
