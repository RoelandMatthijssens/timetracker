require 'rails_helper'

RSpec.describe "timelogs/show", type: :view do
  before(:each) do
    @timelog = assign(:timelog, Timelog.create!(
      project: nil,
      user: nil,
      amount: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
