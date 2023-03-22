Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login',
    sign_out: 'logout',
    password: 'reset-password',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    edit_user_registration: '',
    sign_up: '' }

  authenticated :user do
    root to: 'home#dashboard', as: :authenticated_root
  end

  resources :events, except: %i[index]
  root to: 'home#index'
end
