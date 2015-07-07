Rails.application.routes.draw do

  root 'invoices#index'
  get 'invoices' => 'invoices#index'
  get 'invoices/:id' => 'invoices#invoice_api'

end
