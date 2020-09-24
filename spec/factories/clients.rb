# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    sequence(:name) { |n| "client-#{n.to_s.rjust(3, '0')}" }
  end
end
