# frozen_string_literal: true

class AddUserIdToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :user_id, :integer
  end
end
