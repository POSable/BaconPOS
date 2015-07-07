class InvoicesController < ApplicationController

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
        format.json { render json: pos.errors, status: :unprocessable_entity }
      end
    end
  end

end
