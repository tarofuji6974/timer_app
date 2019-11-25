class Log < ApplicationRecord

  #menuに関するバリデーション
  #未入力不可
  validates :menu,{presence: true}

  validate :start_end_check

  def date_valid?(str)
    #日付が正しく変換できるか。できない場合はfalseを返す
    !! DateTime.parse(self.end_time) rescue false
  end

  #開始日時 < 終了日時にならないようチェック
  def start_end_check

    if date_valid?(self.end_time)
      errors.add(:終了日時, "のフォーマットが正しくありません。")
      return
    end

    #nilチェック
    if self.end_time == nil
      errors.add(:終了日時, "に正しい時間を入力してください(例:yyyy/mm/dd hh:mm:ss)")
      return
    end

    errors.add(:終了日時, "を正しく入力してください。") unless
      self.start_time < self.end_time
  end
end
