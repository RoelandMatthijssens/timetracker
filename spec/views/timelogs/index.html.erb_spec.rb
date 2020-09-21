require 'rails_helper'

RSpec.describe "timelogs/index", type: :view do
  before(:each) do
    assign(:timelogs, [
      Timelog.create!(
        project: nil,
        user: nil,
        amount: ""
      ),
      Timelog.create!(
        project: nil,
        user: nil,
        amount: ""
      )
    ])
  end

  it "renders a list of timelogs" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
