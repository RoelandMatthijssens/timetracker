# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'timelogs/show', type: :view do
  before(:each) do
    @timelog = assign(:timelog, create(:timelog))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{@timelog.amount}/)
    expect(rendered).to match(/#{@timelog.user.email}/)
    expect(rendered).to match(/#{@timelog.project.name}/)
  end
end
