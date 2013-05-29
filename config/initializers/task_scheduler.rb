require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

scheduler.every '15m' do
   require "net/http"
   require "uri"
   urls = ['http://nikalyuk.in', 'http://milavitsa.herokuapp.com', 'http://infocushipchat.herokuapp.com/', 'http://svitla-book-club.herokuapp.com/']
   urls.each do |url|
     Net::HTTP.get_response(URI.parse(url))
   end
end
