class InvoicesController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
    @invoices =  Invoice.all
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
