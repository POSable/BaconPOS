class Transaction < ActiveRecord::Base

  belongs_to :pos
  belongs_to :item

end
