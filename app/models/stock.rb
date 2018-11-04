class Stock < ApplicationRecord
  belongs_to :user, optional: true
  has_many :buys, dependent: :destroy
  has_many :sells, dependent: :destroy
end
