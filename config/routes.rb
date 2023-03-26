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

  root to: 'home#index'

  get ':slug', to: 'users#show', as: :user

  resources :events, except: %i[index]

  resources :bookings, except: %i[edit update new index]
  get '/bookings/new/:id', to: 'bookings#new', as: :new_booking
  get 'bookings/verify/:token', to: 'bookings#verify_email', as: :verify_booking_email

  match '*unmatched', to: 'application#page_not_found', via: :all
end
