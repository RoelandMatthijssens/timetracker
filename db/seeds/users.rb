def seed_enermis
  email = 'admin@redpanda.be'
  return if User.find_by(email: email)

  User.create!(
    email: email,
    password: 'admin1',
    password_confirmation: 'admin1'
  )
end

def seed_users
  seed_enermis
end
