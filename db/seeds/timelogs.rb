def seed_timelogs(count)
  User.all.each do |user|
    projects = Project.all.sample(2)
    count.times do |i|
      date = i.days.ago
      sum = 0
      while sum < 8
        hours = rand(0.25..2.0).round_to(0.25)
        Timelog.create!(
          user: user,
          date: date,
          project: projects.sample,
          amount: hours
        )
        sum += hours
      end
    end
  end
end

class Float
  def round_to(fraction)
    q, = divmod(fraction)
    q * fraction
  end
end
