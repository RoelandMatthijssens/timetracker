# frozen_string_literal: true

class Timelog < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
