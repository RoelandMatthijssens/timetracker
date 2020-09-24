# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'timelogs/index', type: :view do
  before(:each) do
    @timelogs = assign(:timelogs, [
                         create(:timelog),
                         create(:timelog),
                         create(:timelog, billable: false)
                       ])
  end

  it 'renders a list of timelogs' do
    render
    assert_select 'tbody>tr', 3
  end

  it 'should show the project name in the table' do
    render
    @timelogs.each do |timelog|
      expect(rendered).to match(/#{timelog.project.name}/)
    end
  end
  it 'should show the user email in the table' do
    render
    @timelogs.each do |timelog|
      expect(rendered).to match(/#{timelog.user.email}/)
    end
  end
  it 'should have a `billable` column in the table' do
    render
    expect(rendered).to match(/Billable/)
  end
  it 'should show the billability of the logs in the table' do
    render
    expect(rendered).to have_selector('tr>td', text: 'true', count: 2)
    expect(rendered).to have_selector('tr>td', text: 'false', count: 1)
  end
end
