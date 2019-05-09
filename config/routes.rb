Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :annonces
  get 'vos_annonces', to: 'annonces#vos_annonces'
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :annonces, only: [:index, :update, :destroy, :edit]
    resources :users, only: [:index, :update, :destroy, :edit, :new, :create]
    resources :conflicts, only: [:index, :update, :destroy, :edit]
    get 'users/modal_settings', to: 'users#modal_settings'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
