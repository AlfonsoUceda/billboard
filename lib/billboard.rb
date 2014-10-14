require "nokogiri"
require "open-uri"
require "billboard/version"

module Billboard
  module Fetchers
    autoload :Ecartelera, 'billboard/fetchers/ecartelera'
  end
end
