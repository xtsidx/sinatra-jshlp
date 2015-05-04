$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sinatra/jshlp'
require 'rack/test'
require 'rspec'
ENV['RACK_ENV'] = 'test'