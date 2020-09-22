# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :client
  has_many :timelogs
end
