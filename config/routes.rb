Rails.application.routes.draw do
  resources :languages
  resources :providers
  resources :users
  resources :regions
  resource :session
  resources :passwords, param: :token


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "pages/:name", to: "static#page"
  get "static/index"
  get "static/page"

  # temporary route for dashboard
  get "static/page", as: "dashboard"

  # Defines the root path route ("/")
  root "static#index"
end
