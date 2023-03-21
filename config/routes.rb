Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login',
                                             sign_out: 'logout',
                                             password: 'reset-password',
                                             confirmation: 'verification',
                                             unlock: 'unblock',
                                             registration: 'register',
                                             edit_user_registration: '',
                                             sign_up: '' }
  root 'home#index'
end
