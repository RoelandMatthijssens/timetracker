# frozen_string_literal: true

# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

require 'capistrano/scm/git'
require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/postgresql'
require 'capistrano/rbenv'
install_plugin Capistrano::SCM::Git
require 'capistrano/puma'
install_plugin Capistrano::Puma # Default puma tasks
install_plugin Capistrano::Puma::Nginx # if you want to upload a nginx site template

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
