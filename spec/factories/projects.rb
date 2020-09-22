# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    client
    sequence(:name) { |n| "project-#{n.to_s.rjust(3, '0')}" }
  end
end
