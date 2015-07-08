Rails.application.routes.draw do

  root 'invoices#index'
  get 'invoices' => 'invoices#index'
  get 'invoices/:id' => 'invoices#invoice_api'
  post 'fake' => 'fake#api_landing'

end
