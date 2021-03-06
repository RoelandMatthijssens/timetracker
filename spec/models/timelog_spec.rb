# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Timelog, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:amount) }
  it 'should not allow negative amount' do
    timelog = build(:timelog, amount: -1)
    expect(timelog).to_not be_valid
  end
  it 'should default to billable' do
    timelog = create(:timelog)
    expect(timelog.billable).to be_truthy
  end
  it 'should allow billable to be true' do
    timelog = create(:timelog, billable: true)
    expect(timelog.billable).to be_truthy
  end
  it 'should allow billable to be false' do
    timelog = create(:timelog, billable: false)
    expect(timelog.billable).to be_falsey
  end
  it 'should log the timelog on today by default' do
    timelog = create(:timelog, date: nil)
    expect(timelog.date).to eq(Date.today)
  end
end
