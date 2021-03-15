# frozen_string_literal: true

FactoryBot.define do
  factory :timelog do
    project
    user
    amount { 12 }
    billable { true }
    date { rand(14).days.ago.to_date }
  end
end
