# frozen_string_literal: true

FactoryBot.define do
  factory :timelog do
    project { nil }
    user { nil }
    amount { '' }
  end
end
