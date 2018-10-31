class Issue < ApplicationRecord
  has_many :stocks, dependent: :destroy
end
