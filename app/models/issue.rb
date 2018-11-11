class Issue < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :buys, dependent: :destroy
  has_many :sells, dependent: :destroy
  has_one_attached :image

  def self.search(search) #ここでのself.は Issue. を意味する
    if search
      where(['stock_number LIKE ? or company_name LIKE ?', "%#{search}%", "%#{search}%"]) #検索とstock_numberの部分一致を表示。Issue.は省略
      # where(['company_name LIKE ?', "%#{search}%"]) #検索とcompany_nameの部分一致を表示。Issue.は省略
    else
      all #全て表示。Issue. は省略
    end
  end
end
