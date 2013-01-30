ROOT_PATH = File.expand_path(File.dirname(__FILE__))

require 'yaml'

require File.join(ROOT_PATH, '/remote-terminal/cli')
require File.join(ROOT_PATH, '/remote-terminal/project')
require File.join(ROOT_PATH, '/remote-terminal/rsync')
require File.join(ROOT_PATH, '/remote-terminal/ssh')