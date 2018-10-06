Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'login', to: "devise/sessions#new", as: "login"
    get 'logout', to: "devise/sessions#destroy", as: "logout"
    get 'signup', to: "users#new", as: "signup"
  end

  get 'users/reset_user_type' => 'users#reset_user_type', as: 'reset_user_type'
  get 'house_hunters/set_user_type/:id' => 'house_hunters#set_user_type', as: 'set_type_house_hunter'
  get 'realtors/set_user_type/:id' => 'realtors#set_user_type', as: 'set_type_realtor'
  get 'admins/set_user_type/:id' => 'admins#set_user_type', as: 'set_type_admin'
  get 'houses/search' => 'houses#search', as: 'search_houses'
  get 'house_hunters/:hh_id/interest_list/:id/add_to_list/:house_id' => 'interest_lists#add_to_list', as: 'add_to_list'
  get 'house_hunters/:hh_id/inquiries/new/:house_id' => 'inquiries#create', as: 'new_house_hunter_inquiry_path'

  # get 'real_estate_companies/:id/potential_buyers', to: 'real_estate_companies#potential_buyers'

  resources :users

  resources :houses do
    resource :potential_buyers_lists
  end

  resources :realtors
  get 'realtors/:id/edit_company', to: 'realtors#edit_company'

  resources :house_hunters do
    resources :inquiries
  end
  resources :inquiries

  resources :house_hunters do
    resources :interest_lists
  end

  get 'start_page/index'
  root 'start_page#index'

  resources :admins
  resources :real_estate_companies
end
