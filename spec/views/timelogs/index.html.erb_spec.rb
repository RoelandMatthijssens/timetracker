# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'timelogs/index', type: :view do
  before(:each) do
    @project1 = create(:project)
    @project2 = create(:project)
    @project3 = create(:project)
    today = Date.today
    @timelogs = assign(:timelogs, {
      @project1 => {
        today => [create(:timelog, project: @project1, date: today)]
      },
      @project2 => {
        today => [create(:timelog, project: @project2, date: today)]
      },
      @project3 => {
        today => [create(:timelog, project: @project3, date: today)]
      }
    })
    # @grouped_timelogs = assign(:grouped_timelogs, {})
  end

  it 'renders the name of each project with a timelog' do
    render
    expect(rendered).to match(/#{@project1.name}/)
    expect(rendered).to match(/#{@project2.name}/)
    expect(rendered).to match(/#{@project3.name}/)
  end
end
