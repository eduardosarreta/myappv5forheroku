class BookmarkedSenator < ApplicationRecord
  validates :user_id, :presence => true
  validates :senator_id, :uniqueness => true
  belongs_to :senator
  belongs_to :user
end
