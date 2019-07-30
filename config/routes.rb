Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :annonces
  get 'vos_annonces', to: 'annonces#vos_annonces'
  get 'vos_echanges', to: 'echanges#vos_echanges'
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :annonces, only: [:index, :update, :destroy, :edit]
    resources :users, only: [:index, :update, :destroy, :edit, :new, :create]
    resources :conflits, only: [:index, :update, :destroy, :edit, :new, :create]
    get 'users/modal_settings', to: 'users#modal_settings'
  end
  resources :echanges, only: [:index, :update, :destroy, :edit, :new, :create]
  resources :conversations do
    resources :messages
  end
  get 'ajax_modal_echange', to: 'echanges#infos_modal_echange'
  get 'ajax_modal_get_infos_annonce', to: 'echanges#infos_selected_anonce_modal'
end
