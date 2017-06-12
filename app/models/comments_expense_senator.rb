class CommentsExpenseSenator < ApplicationRecord
  validates :user_id, :presence => true
  belongs_to :senator
  belongs_to :user
  belongs_to :red_flag_expense_senator
end
