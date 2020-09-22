# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :client
  has_many :timelogs
  validates_presence_of :name
end
