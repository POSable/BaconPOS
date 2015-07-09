class Invoice < ActiveRecord::Base

  after_save :send_cloud_elements_webhook

  has_many :transactions, dependent: :destroy
  has_many :items, through: :transactions
  belongs_to :pos
  belongs_to :customer

  def build_invoice_hash
    invoice_hash = {}
    invoice_hash[:customer] = self.customer.name
    invoice_hash[:pos_name] = self.pos.name
    transactions = self.transactions
    invoice_hash[:transactions] = {}
    transactions.each do |transaction|
      invoice_hash[:transactions][transaction.item.id] = {name: transaction.item.name, quantity: transaction.qty, unit_price: transaction.item.price}
    end
    invoice_hash[:total] = self.total
    invoice_hash
  end

  def send_cloud_elements_webhook
    require "http"
    response = HTTP.post("https://staging.cloud-elements.com/elements/api-v2/events/posable",
      :json => {:status => "ok",
                :message => "New/Edited POS ID and Token",
                :recorid => self.id,
                :token => User.find_by(username: "ce").auth_token,
                :lastUpdated => self.updated_at.strftime("%m/%d/%Y") + " " + self.updated_at.strftime("%Y-%m-%dT%H:%M:%S"),
                :quickbooks_id => 1,
                :xero_id => 1,
                :greatplains_id => 1,
                :freshbooks_id => 1,
                :netsuite_id => 1
      }
    )
  end
end
