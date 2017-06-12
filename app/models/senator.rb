class Senator < ApplicationRecord
  has_many :bookmarked_senators, :dependent => :destroy
  has_many :red_flags_expenses_senators, :dependent => :destroy
end
