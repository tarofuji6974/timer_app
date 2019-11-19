class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.string :user_name
      t.datetime :start_time
      t.datetime :end_time
      t.text :menu

      t.timestamps
    end
  end
end
