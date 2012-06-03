
rackspace_nodes = {
  :hatchery_node_0 => '173.45.253.130',
  :hatchery_node_1 => '198.101.199.40',
  :hatchery_node_2 => '198.101.199.41'
}


set :application, 'ruby-scratch'
set :repository,  'https://github.com/cclamb/ruby-scratch.git'

set :user, 'overlay'
set :password, ''
#hosts = '173.45.253.130'

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
set :use_sudo, false
set :deploy_to, '~'

role :nodes, '173.45.253.130', '198.101.199.40', '198.101.199.41'

# task :spinner_start, :roles => :nodes do
# 	run 'ruby-scratch/bin/spinner'
# end

# task :spinner_refresh, :roles => :nodes do
# 	run 'cd ruby-scratch ; git pull'
# end

cnt = 0

namespace :nodes do

	task :start, :roles => :nodes do
    cmd = "current/bin/spinner #{cnt}"
    puts "\t\t CMD: #{cmd}"
		run cmd
    cnt += 1
	end

end