Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :annonces
  get 'vos_annonces', to: 'annonces#vos_annonces'
  namespace :admin do
    resources :annonces, only: [:index, :update, :destroy, :edit]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
