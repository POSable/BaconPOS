Rails.application.routes.draw do

  root 'invoices#index'
  get 'invoices' => 'invoices#index'
  get 'invoices/:id' => 'invoices#invoice_api'
  post 'invoice/ajax_create' => 'invoices#create_ajax_invoice'
  # VVVVVVV temp for Cloud Elements Setup VVVVVVV
  get 'invoice/new!' => 'invoices#temp_edit_invoice_api'

end
