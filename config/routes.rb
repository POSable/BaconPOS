Rails.application.routes.draw do

  root 'invoices#index'

  get 'invoices' => 'invoices#index'
  get 'invoices/:id' => 'invoices#invoice_api'
  post 'invoice/ajax_create' => 'invoices#create_ajax_invoice'
  # VVVVVVV temp for Cloud Elements Setup VVVVVVV
  get 'invoice/new!' => 'invoices#temp_edit_invoice_api'

  get 'users/dashboard' => 'users#dashboard', as: :user_dash
  get 'users/index' => 'users#index'

  get '/sign-in' => 'sessions#new', as: :signin
  post '/sign-in' => 'sessions#create'
  get '/sign-out' => 'sessions#destroy', as: :signout

end
