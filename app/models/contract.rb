class Contract < ApplicationRecord

# 約定
# BuyとSellのpriceが同じ時に実行
# BuyとSellのamountを比較して、小さい方のamount分を約定
# ※amountの単位が最小単位毎にBuyとSellそれぞれのDBに格納しないと、部分約定ができない・・・？

end
