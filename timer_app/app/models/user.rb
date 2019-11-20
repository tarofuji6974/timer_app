class User < ApplicationRecord
  #nameカラムに関するバリデーション
  #未入力不可/ユニーク名のみ
  validates :name,{presence: true,
    uniqueness: true}

  #password_digestに関するバリデーション
  #未入力不可
  validates :password_digest,{presence: true}

end
