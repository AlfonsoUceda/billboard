require "nokogiri"
require "open-uri"
require "billboard/version"

module Billboard
  module Crawlers
    autoload :Ecartelera, 'billboard/crawlers/ecartelera'
  end
end
