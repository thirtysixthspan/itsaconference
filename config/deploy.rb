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
      run "mkdir -p #{shared_path}/speaker_photos"
      run "ln -s #{shared_path}/speaker_photos #{release_path}/public/speaker_photos"
      run "/etc/init.d/reddirtrubyconf stop"
      run "sleep 5"
      run "/etc/init.d/reddirtrubyconf start"
    end
  end
end
