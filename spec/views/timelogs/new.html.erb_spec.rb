require 'rails_helper'

RSpec.describe "timelogs/new", type: :view do
  before(:each) do
    assign(:timelog, Timelog.new(
      project: nil,
      user: nil,
      amount: ""
    ))
  end

  it "renders new timelog form" do
    render

    assert_select "form[action=?][method=?]", timelogs_path, "post" do

      assert_select "input[name=?]", "timelog[project_id]"

      assert_select "input[name=?]", "timelog[user_id]"

      assert_select "input[name=?]", "timelog[amount]"
    end
  end
end
