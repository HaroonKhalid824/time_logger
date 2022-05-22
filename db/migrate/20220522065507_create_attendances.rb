class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.bigint :user_id
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
