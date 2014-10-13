require "rubygems"
require "bundler/setup"
require "nokogiri"
require "open-uri"
require "billboard/version"

module Billboard
  autoload :Fetcher, 'billboard/fetcher'
end
