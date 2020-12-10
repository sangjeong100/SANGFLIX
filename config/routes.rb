Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  get '/mypage' => 'users#mypage'

  resources :movies do 
    member do
      put :toggle_like
    end
  end 
  resources :users
  resources :orders do
    collection do
      put :update_status 
    end  
  end 
end
