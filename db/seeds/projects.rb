# frozen_string_literal: true

def seed_projects(projects)
  projects.each do |client_name, project_names|
    client = Client.find_by(name: client_name)
    next unless client

    project_names.each do |project_name|
      project = Project.find_by(name: project_name, client: client)
      next if project

      Project.create!(
        client: client,
        name: project_name
      )
    end
  end
end
