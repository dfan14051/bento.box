Rails.application.routes.draw do
  resources :comments
  resources :orders
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root :to => 'orders#index', as: :authenticated_root
    end
      root :to => 'welcome#index', as: :unauthenticated_root
  end

  root 'welcome#index'
end
