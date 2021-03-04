# frozen_string_literal: true

class Timelog < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0
  validates_inclusion_of :billable, in: [true, false]

  after_create :set_date

  def set_date
    self.date = Date.today if date.nil?
  end
end
