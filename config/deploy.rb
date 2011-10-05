set :application, "dajuju.com"
set :location, "dajuju.com"

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:Carpela/Dajuju.git"  # Your clone URL
set :scm, "git"
set :user, "cmpnr"  # The server's user for deploys
set :password, "cmpnrpa55"

set :use_sudo, false

set :branch, "master"
set :deploy_via, :remote_cache

set :git_enable_submodules, 1

role :web, location # Your HTTP server, Apache/etc
role :app, location # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.8.7'        # Or whatever env you want it to run in.
set :rvm_type, :user

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
