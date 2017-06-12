class BookmarkedDeputy < ApplicationRecord
  validates :user_id, :presence => true
  validates :deputy_id, :uniqueness => true
  belongs_to :deputy
  belongs_to :user
end
