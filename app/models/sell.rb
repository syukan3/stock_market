class Sell < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stock, optional: true
end
