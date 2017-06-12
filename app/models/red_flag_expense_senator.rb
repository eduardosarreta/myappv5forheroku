class RedFlagExpenseSenator < ApplicationRecord
  validates :user_id, :presence => true
  belongs_to :senator
  belongs_to :user
  has_many :comments_expense_senators, :dependent => :destroy
end
