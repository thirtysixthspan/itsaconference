require "config/database"

set :application, "itsaconference"
set :repository,  "git@github.com:thirtysixthspan/itsaconference.git"

set :template_dir, "config/"
set :scm, :git
set :deploy_to, "/srv/www/reddirtrubyconf.com"
set :user, "deployer"

server "reddirtrubyconf.com", :app, :web, :db, :primary => true

ssh_options[:forward_agent] = true

namespace :deploy do
  [:restart].each do |default_task|
    task default_task do 
        # ... ahh, silence!
    end
  end
end
