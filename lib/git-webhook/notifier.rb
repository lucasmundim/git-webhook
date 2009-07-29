require 'net/http'
require 'uri'
require 'rubygems'
require 'active_support'

module GitWebhook
  class Notifier

    def initialize(data_hash)
      @data_hash = data_hash
    end

    def notify(url)
      Net::HTTP.post_form(URI.parse(url), { :payload => @data_hash.to_json })
      puts @data_hash.to_yaml
    end

  end
end
