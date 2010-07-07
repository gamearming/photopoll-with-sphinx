# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.gem(
    'thinking-sphinx',
    :lib     => 'thinking_sphinx',
    :version => '1.3.18'
  )
end

require 'riddle/0.9.9'

cluster_state = '/var/lib/scalarium/cluster_state.json'
if Rails.env.production? and File.exist?(cluster_state) and not ActiveSupport::JSON.decode(File.read(cluster_state))['instance']['roles'].include?('sphinx')
  ThinkingSphinx.remote_sphinx = true
end

