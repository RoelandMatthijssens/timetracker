class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :timelogs

  def hours_worked(project: nil, date: nil)
    options = {}
    options[:project] = project if project
    options[:date] = date if date
    logs = timelogs.where(options)
    logs.map(&:amount).reduce(:+)
  end

  def timelogs_by_project_by_date
    result = {}
    timelogs.each do |timelog|
      result[timelog.project] = {} unless result.key?(timelog.project)
      result[timelog.project][timelog.date] = [] unless result[timelog.project].key?(timelog.date)
      result[timelog.project][timelog.date] << timelog
    end
    result
  end
end
