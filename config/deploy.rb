
require 'bundler/capistrano'

require 'yaml'
require 'aws-sdk'

set :application, 'ruby-scratch'
set :repository,  'https://github.com/cclamb/ruby-scratch.git'

creds_file_name = 'etc/creds.yaml'

creds = YAML::load File::open(creds_file_name)

msg =<<EOF
Submitted credentials are:
  rackspace password: #{creds['rackspace']['password']}
  amazon access key: #{creds['amazon']['access_key']}
  amazon secret key: #{creds['amazon']['secret_key']}
EOF

puts msg

set :user, 'overlay'
set :password, creds['rackspace']['password']

set :scm, :git
set :use_sudo, false
set :deploy_to, '~'

role :nodes, '198.101.205.153', \
  '198.101.205.155', \
  '198.101.205.156'

# Prime simulation configuration
config_file_name = 'etc/config.yaml'

access_key = creds['amazon']['access_key']
secret_key = creds['amazon']['secret_key']

AWS.config \
  :access_key_id => access_key, \
  :secret_access_key => secret_key

# Push to S3
config_bucket = AWS::S3.new.buckets[:chrislambistan_configuration]
config_bucket.clear!
obj = config_bucket.objects[:current]
obj.write :file => config_file_name
url = obj.url_for :read

cnt = 0

namespace :nodes do

	task :start, :roles => :nodes do
		run "cd current ; bundle exec bin/spinner #{url}"
	end

end