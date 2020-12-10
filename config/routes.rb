Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  get '/mypage' => 'users#mypage'
  put '/update_info' => 'users#update'

  resources :movies do 
    member do
      put :toggle_like
    end
    collection do
      get :search 
    end 
  end 
  resources :users
  resources :orders do
    member do 
      put :update_rating
    end
    collection do
      put :update_status 
    end  
  end 
end
