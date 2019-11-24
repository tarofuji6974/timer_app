class Log < ApplicationRecord

  #start_timeに関するバリデーション
  #未入力不可
  #validates :start_time,{presence: true}

  #menuに関するバリデーション
  #未入力不可
  validates :menu,{presence: true}
end
