class RedFlagExpenseDeputy < ApplicationRecord
  validates :user_id, :presence => true
  belongs_to :deputy
  belongs_to :user
  has_many :comments_expense_deputies, :dependent => :destroy
end
