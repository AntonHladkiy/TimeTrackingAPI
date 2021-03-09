# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  validates :project, presence: true
  validates :category, presence: true
  validates :hours, presence: true, numericality: { greater_than: 0 }
end
