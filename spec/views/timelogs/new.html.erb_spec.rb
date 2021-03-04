# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'timelogs/new', type: :view do
  before(:each) do
    assign(:timelog, Timelog.new)
  end

  it 'renders new timelog form' do
    render

    assert_select 'form[action=?][method=?]', timelogs_path, 'post' do
      assert_select 'select[name=?]', 'timelog[project_id]'
      assert_select 'select[name=?]', 'timelog[user_id]'
      assert_select 'input[name=?]', 'timelog[amount]'
      assert_select 'input[name=?]', 'timelog[date]'
    end
  end
end
