set :user, 'overlay'

hosts = '173.45.253.130'

task :list_home, :hosts => hosts do
  run 'ls -al'
end

task :start, :hosts => hosts do
  run './overlay-network/bin/overlay -s'
end

task :stop, :hosts => hosts do
  run './overlay-network/bin/overlay -t'
end

task :reload, :hosts => hosts do

end

task :refresh, :hosts => hosts do
  run 'cd overlay-network ; git pull'
end

task :restart, :hosts => hosts do

end

task :bundle_install, :hosts => hosts do
  run 'cd overlay-network ; bundle --no-color install'
end

task :rvm_list, :hosts => hosts do
  run 'gem list'
end

task :env, :hosts => hosts do
  run 'env'
end
