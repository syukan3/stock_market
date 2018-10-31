class Stock < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders, dependent: :destroy
end
