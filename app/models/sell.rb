class Sell < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stock, optional: true
  belongs_to :issue, optional: true
  has_many :contracts
  has_many :buys, through: :contracts
end
