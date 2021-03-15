# frozen_string_literal: true

class Activity < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  settings do
    mappings dynamic: false do
      indexes :user_id, type: :numericality
      indexes :category, type: :text
      indexes :project, type: :text
    end
  end

  belongs_to :user
  validates :project, presence: true
  validates :category, presence: true
  validates :hours, presence: true, numericality: { greater_than: 0 }
  def self.filtered_search(query)
    self.__elasticsearch__.search(
      query: {
        multi_match: {
          query:query,
          fields: %w[category user_id project]
        }
      }
    )
  end
end
