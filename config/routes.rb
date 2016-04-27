require 'api_constraints'
Rails.application.routes.draw do
  resources :project_roles, :project_milestones, :professions, :project_attachments, :states,
            :states, :states, :activity_members, :organizations, :activities, :project_members,
            :project_donors, :project_partners, :projects, :members, :roles, :donors, :branches,
            :locations, :states, :users, :tags, :costs, :lines

  resource :trello_webhooks, only: %i(show create), defaults: { formats: :json }

  resources :projects do
    resources :project_attachments
  end

  # resources :projects do
  #   resources :project_members
  # end
  
  resources :activities do
    resource :cost
  end

  resource :project do
    post :add_member
    #get :remove_member
  end

  resource :activity do
    post :add_member
    #get :remove_member
  end
  
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1 , default: :true) do
      resources :projects
      resources :activities
    end
  end

  #get '/auth/twitter/callback', to: 'sessions#create'
  
  devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
    match "/confirm", to: "confirmations#confirm", via: :put 
    get '/auth/failure', to: 'sessions#new'
  end

  devise_for :users, :path => '', :path_names => { sign_in: 'login', sign_out: 'logout'}, :controllers => { omniauth_callbacks: "callbacks", confirmations: "confirmations", sessions: "sessions", registrations: "registrations" }

  get 'settings' => 'dashboard#settings', :as => "settings"

  root :to => "projects#index"
end
