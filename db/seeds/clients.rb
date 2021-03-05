def seed_clients(client_names)
  client_names.each do |client_name|
    client = Client.find_by(name: client_name)
    next if client

    Client.create!(
      name: client_name
    )
  end
end
