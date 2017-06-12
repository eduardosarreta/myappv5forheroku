class CommentsExpenseDeputy < ApplicationRecord
  validates :user_id, :presence => true  
  belongs_to :deputy
  belongs_to :user
  belongs_to :red_flag_expense_deputy
end
