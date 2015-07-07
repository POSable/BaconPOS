class Invoice < ActiveRecord::Base

  has_many :transactions, dependent: :destroy
  has_many :items, through: :transactions
  belongs_to :pos
  belongs_to :customer

  def build_invoice_hash
    invoice_hash = {}
    invoice_hash[:customer] = self.customer.name
    invoice_hash[:pos_name] = self.pos.name
    transactions = self.transactions
    invoice_hash[:transactions] = []
    transactions.each do |transaction|
      invoice_hash[:transactions] << [transaction.qty, transaction.item.name]
    end
    invoice_hash[:total] = self.total
    invoice_hash
  end

end
