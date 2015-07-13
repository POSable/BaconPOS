class InvoicesController < ApplicationController
  before_action :authenticate, except: [:index, :temp_edit_invoice_api, :create_ajax_invoice]

  def index
    @invoices =  Invoice.all
  end

  def create_ajax_invoice
    new_invoice = Invoice.create!()
    transactions = JSON.parse(params[:transactions])
    item_total = 0
    transactions.each do |transaction|
      Transaction.create!(item_id: transaction['item_id'], qty: transaction['item_qty'], invoice_id: new_invoice.id)
      item_total += transaction['item_qty'].to_i * Item.find(transaction['item_id']).price
    end

    new_invoice.update!(total: item_total, customer_id: params['customer_id'], pos_id: params['pos_id'])

    respond_to do |format|
      format.json {render json: new_invoice}
    end
  end

  def invoice_api
    invoice = Invoice.find(params[:id])
    if invoice
      invoice_api = invoice.build_invoice_hash
      respond_to do |format|
        format.json {render json: invoice_api}
      end
    else
      respond_to do |format|
        format.json {render json: pos.errors, status: :unprocessable_entity}
      end
    end
  end

  def temp_edit_invoice_api
    new_invoice = Invoice.create!(pos_id: Pos.last.id, customer_id: Customer.last.id)
    new_transaction = Transaction.create!(invoice_id: new_invoice.id, item_id: Item.last.id, qty: 10)
    new_invoice.update!(total: Item.last.price * new_transaction.qty)
    render json: {new_invoice: new_invoice, new_transaction: new_transaction}
  end

  protected
    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad Token', status: 401
    end

end
