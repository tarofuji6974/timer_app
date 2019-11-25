class Log < ApplicationRecord

  #menuに関するバリデーション
  #未入力不可
  validates :menu,{presence: true}

  validate :start_end_check

  #開始日時 < 終了日時にならないようチェック
  def start_end_check
    errors.add(:終了日時, "を正しく記入してください。") unless
    self.start_time < self.end_time
  end
end
