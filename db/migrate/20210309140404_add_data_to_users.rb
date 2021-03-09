# frozen_string_literal: true

class AddDataToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :firstName, :string
    add_column :users, :secondName, :string
  end
end
