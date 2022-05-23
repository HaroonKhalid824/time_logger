# frozen_string_literal: true

class AddNameInUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :name, :string
  end

  def down
    remove_column :users, :name, :string
  end
end
