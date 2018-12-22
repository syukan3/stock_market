class Buy < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stock, optional: true
  belongs_to :issue, optional: true

  has_one :contracts
  has_many :sells, through: :contracts
end
