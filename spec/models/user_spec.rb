require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }

  describe 'hours worked on' do
    before do
      @user = create(:user)
      @today = Date.today
      @yesterday = Date.yesterday
      @project1 = create(:project)
      @project2 = create(:project)
      create(:timelog, user: @user, project: @project1, amount: 1, date: @today)
      create(:timelog, user: @user, project: @project1, amount: 2, date: @yesterday)
      create(:timelog, user: @user, project: @project2, amount: 3, date: @today)
      create(:timelog, user: @user, project: @project2, amount: 4, date: @yesterday)
    end
    it 'calculates the sum of all timelogs when no project or date is specified' do
      expect(@user.hours_worked).to eq(10)
    end
    it 'considers only timelogs from the specified project' do
      expect(@user.hours_worked(project: @project1)).to eq(3)
      expect(@user.hours_worked(project: @project2)).to eq(7)
    end
    it 'considers only timelogs from the specified date' do
      expect(@user.hours_worked(date: @today)).to eq(4)
      expect(@user.hours_worked(date: @yesterday)).to eq(6)
    end
    it 'considers only timelogs from the specified date and project combination' do
      expect(@user.hours_worked(date: @today, project: @project1)).to eq(1)
      expect(@user.hours_worked(date: @yesterday, project: @project1)).to eq(2)
      expect(@user.hours_worked(date: @today, project: @project2)).to eq(3)
      expect(@user.hours_worked(date: @yesterday, project: @project2)).to eq(4)
    end
  end

  describe 'timelogs by project' do
    before do
      @user = create(:user)
      @today = Date.today
      @yesterday = Date.yesterday
      @project1 = create(:project)
      @project2 = create(:project)
    end
    it 'groups all timelogs by project' do
      create(:timelog, user: @user, project: @project1)
      create(:timelog, user: @user, project: @project2)
      grouped_timelogs = @user.timelogs_by_project_by_date
      project_ids = grouped_timelogs.keys.map(&:id)
      expect(project_ids).to include(@project1.id)
      expect(project_ids).to include(@project2.id)
    end
    it 'groups timelogs within each project by date' do
      create(:timelog, user: @user, project: @project1, date: @today)
      create(:timelog, user: @user, project: @project1, date: @yesterday)

      grouped_timelogs = @user.timelogs_by_project_by_date
      project = grouped_timelogs.keys[0]
      dates = grouped_timelogs[project]
      expect(dates.keys).to include(@today)
      expect(dates.keys).to include(@yesterday)
    end
  end
end
