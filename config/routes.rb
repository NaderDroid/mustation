Rails.application.routes.draw do


  # libraries :sessions, :controller => 'sessions', :only %i[create new destroy]

  Clearance
  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, controller: 'clearance/users', only: [:create] do
  resource :password, controller: 'clearance/passwords', only: %i[create edit update]
  end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'
  get 'welcome', to: 'welcome#index'
  resources :songs
  resources :libraries
  root 'welcome#index'
  # get '*_path', to: 'songs#error404'
end
