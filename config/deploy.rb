require 'mina/bundler'
require 'mina/git'
require 'mina/rvm'

set :user, 'aquarhead'
set :domain, 'vps.teawhen.com'
set :deploy_to, '/home/aquarhead/projects/bgmVisual'
set :repository, 'git@github.com:AquarHEAD/bgmVisual.git'
set :branch, 'master'

task :environment do
  invoke :'rvm:use[2.0.0@bgmVisual]'
end

task :setup => :environment do
  invoke :'rvm:wrapper[2.0.0@bgmVisual,bgmVisual-server,ruby]'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'bundle:install'

    to :launch do
      queue "touch #{deploy_to}/current/tmp/restart.txt"
    end
  end
end
