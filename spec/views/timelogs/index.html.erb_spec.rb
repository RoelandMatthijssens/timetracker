# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'timelogs/index', type: :view do
  before(:each) do
    assign(:timelogs, [
             create(:timelog),
             create(:timelog)
           ])
  end

  it 'renders a list of timelogs' do
    render
    assert_select 'tbody>tr', 2
  end
end
