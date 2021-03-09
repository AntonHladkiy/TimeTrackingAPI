# frozen_string_literal: true

class AddDataToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :project, :string
    add_column :activities, :category, :string
    add_column :activities, :hours, :integer
    add_column :activities, :name, :string
  end
end
