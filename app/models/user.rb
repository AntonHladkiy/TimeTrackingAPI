# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[developer admin]
  has_many :activities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_save :index_activities_in_elasticsearch

  private

  def index_activities_in_elasticsearch
    activities.find_each { |activity| activity.__elasticsearch__.index_document }
  end
end
