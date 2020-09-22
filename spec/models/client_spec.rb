# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:projects) }
  it { should validate_uniqueness_of(:name) }
end
