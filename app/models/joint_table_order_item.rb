class JointTableOrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
end 
