class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookmarked_deputies, :dependent => :destroy
  has_many :bookmarked_senators, :dependent => :destroy
  has_many :red_flags_expenses_deputies, :dependent => :destroy
  has_many :red_flags_expenses_senators, :dependent => :destroy
end
