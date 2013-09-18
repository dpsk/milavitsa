require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

scheduler.every '15m' do
   require "net/http"
   require "uri"
   urls = ['http://infocushipchat.herokuapp.com/', 'http://kindreminders.herokuapp.com', , 'http://milavitsa.herokuapp.com',]
   urls.each do |url|
     Net::HTTP.get_response(URI.parse(url))
   end
end
