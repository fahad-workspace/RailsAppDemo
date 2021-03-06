# config valid only for Capistrano 3.1
lock '3.2.1'

#set :application, 'my_app_name'
#set :repo_url, 'git@example.com:me/my_repo.git'

set :application, 'RailsAppDemo'
set :repo_url, 'https://github.com/fahad-workspace/RailsAppDemo.git'
set :branch, 'master'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    execute "touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
	end

  #task :restart do
		#on "fahadsarwar@172.16.2.99" do
			#on roles(:app), in: :sequence, wait: 5 do
				## Your restart mechanism here, for example:
				#path = release_path.join('StartWebApp.sh')
				#execute "echo '#!/bin/bash' >> #{path}"
				#execute "echo 'cd #{release_path}' >> #{path}"
				#execute "echo 'bundle install' >> #{path}"
				#execute "echo 'RAILS_ENV=staging rails server' >> #{path}"
				##execute "bash #{path}"
			#end
    #end
  #end

  after :publishing, :restart
  
  #after 'deploy:publishing', 'deploy:restart'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
