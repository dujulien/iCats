class Order < ApplicationRecord
  belongs_to :user
  has_many :joint_table_order_items
  has_many :items, through: :joint_table_order_items

  after_create :order_send

  def order_send
    UserMailer.order_email(self).deliver_now
  end
  
end
