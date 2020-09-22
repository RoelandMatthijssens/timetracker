# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index', type: :view do
  before(:each) do
    assign(:projects, [
             create(:project),
             create(:project)
           ])
  end

  it 'renders a list of projects' do
    render
    assert_select 'tbody>tr', 2
  end
end
