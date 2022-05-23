# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.bigint :user_id
      t.datetime :time_in
      t.datetime :time_out
      t.string :status

      t.timestamps
    end
  end
end
