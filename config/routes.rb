Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :annonces
  get 'vos_annonces', to: 'annonces#vos_annonces'
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :annonces, only: [:index, :update, :destroy, :edit]
    resources :users, only: [:index, :update, :destroy, :edit, :new, :create]
    resources :echanges, only: [:index, :update, :destroy]
    get 'users/modal_settings', to: 'users#modal_settings'
  end
  resources :conversations do
    resources :messages
  end
  resources :echanges, only: [:index, :update, :destroy, :edit, :new, :create]
  get 'vos_echanges', to: 'echanges#vos_echanges'

  # AJAX
  get 'ajax_get_annonce_infos_for_modal', to: 'echanges#get_annonce_infos_for_modal'
end
