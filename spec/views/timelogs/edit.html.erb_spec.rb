# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'timelogs/edit', type: :view do
  before(:each) do
    @timelog = assign(:timelog, create(:timelog))
  end

  it 'renders the edit timelog form' do
    render
    assert_select 'form[action=?][method=?]', timelog_path(@timelog), 'post' do
      assert_select 'select[name=?]', 'timelog[project_id]'
      assert_select 'select[name=?]', 'timelog[user_id]'
      assert_select 'input[name=?]', 'timelog[amount]'
    end
  end
end
