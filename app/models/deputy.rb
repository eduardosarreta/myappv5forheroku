class Deputy < ApplicationRecord
  has_many :bookmarked_deputies, :dependent => :destroy
  has_many :red_flags_expenses_deputies, :dependent => :destroy
end
