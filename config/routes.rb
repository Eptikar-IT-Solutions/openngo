require 'api_constraints'
Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :project_roles
  resources :project_milestones
  resources :professions
  resources :project_attachments
  resources :states
  resources :states
  resources :states
  resources :activity_members
  resources :organizations
  resources :activity_locations
  resources :activities
  resources :project_members
  resources :project_donors
  resources :project_partners
  resources :project_locations
  resources :projects
  resources :members
  resources :roles
  resources :donors
  resources :branches
  resources :locations
  resources :states
  
  root :to => "users#index"
  resources :users
  #resources :sessions
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1 , default: :true) do
      resources :projects
      resources :activities
    end
  end

   devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

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
