# frozen_string_literal: true

FactoryBot.define do
  factory :timelog do
    project
    user
    amount { 12 }
    billable { true }
  end
end
