require 'api_constraints'
Rails.application.routes.draw do

  resources :costs
  resources :lines
  devise_for :users, :path => '', :path_names => { sign_in: 'login', sign_out: 'logout'}, :controllers => { omniauth_callbacks: "callbacks", confirmations: "confirmations", sessions: "sessions", registrations: "registrations" }

  resources :project_roles
  resources :project_milestones
  resources :professions
  resources :project_attachments
  resources :states
  resources :states
  resources :states
  resources :activity_members
  resources :organizations
  resources :activities
  resources :project_members
  resources :project_donors
  resources :project_partners
  resources :projects
  resources :members
  resources :roles
  resources :donors
  resources :branches
  resources :locations
  resources :states
  resources :users
  resources :tags
  #resource :trello_webhooks, defaults: { formats: :json }
  resources :projects do
    resources :project_attachments
  end
  resources :activities do
    resource :cost
  end

  root :to => "projects#index"

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1 , default: :true) do
      resources :projects
      resources :activities
    end
  end

  devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
    match "/confirm", to: "confirmations#confirm", via: :put 
  end

  resource :trello_webhooks, only: %i(show create), defaults: { formats: :json }
end
