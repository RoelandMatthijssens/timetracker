# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/edit', type: :view do
  before(:each) do
    @project = assign(:project, create(:project))
  end

  it 'renders the edit project form' do
    render
    assert_select 'form[action=?][method=?]', project_path(@project), 'post' do
      assert_select 'select[name=?]', 'project[client_id]'
      assert_select 'input[name=?]', 'project[name]'
    end
  end
end
