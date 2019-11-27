class Log < ApplicationRecord

  #menuに関するバリデーション
  #未入力不可
  validates :menu,{presence: true}

end
