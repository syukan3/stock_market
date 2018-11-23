class Stock < ApplicationRecord
  belongs_to :user, optional: true
  has_many :buys
  has_many :sells
  has_many :contracts
end
