Rails.application.routes.draw do

  get 'requests/index'
  get 'requests/new'
  get 'requests/create'
  get 'requests/edit'
  get 'requests/update'
  get 'requests/destroy'
  get 'requests/list'
  root 'pages#home'

  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show'
  get '/selling_orders', to: 'orders#selling_orders'
  get '/buying_orders', to: 'orders#buying_orders'
  
  post '/users/edit', to: 'users#update'

  put '/orders/:id/complete', to: 'orders#complete', as: 'complete_order'


  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end
    resources :orders, only: [:create] 
  end

  devise_for :users, 
              path: '', 
              path_names:{sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers:{omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
