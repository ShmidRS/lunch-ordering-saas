Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'orders#index'

  namespace :admin do
    resources :dishes, except: :show
  end
  resources :orders, except: :show
  resources :dashboards

  namespace :api do
    namespace :v1 do
      get 'user_orders' => 'user_orders#index'
    end
  end
end
