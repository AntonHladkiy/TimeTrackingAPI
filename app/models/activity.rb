# frozen_string_literal: true

class Activity < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :category, type: :text
      indexes :project, type: :text
    end
  end

  belongs_to :user
  validates :project, presence: true
  validates :category, presence: true
  validates :hours, presence: true, numericality: { greater_than: 0 }
end
