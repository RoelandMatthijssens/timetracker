# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :projects
  validates_presence_of :name
  validates_uniqueness_of :name
end
