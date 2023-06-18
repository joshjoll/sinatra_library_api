require "rubygems"
require "bundler"
Bundler.require(:default)                   # load all the default gems
Bundler.require(Sinatra::Base.environment)