#! /usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
require 'date'

# Variables

# GitHub username
username="carlgo11"
# Email address to send to
email_address="user@example.com"
# Path for email template to use
email_template="$HOME/github_activity/email_template.txt"

doc = Nokogiri::HTML(open("https://github.com/#{username}.atom"))
last_date =  doc.css("feed entry published").first.content.split('T')[0]

d = Date.parse(Time.now.to_s)
current_date = d.strftime("%Y-%m-%d")

if( last_date != current_date) then
puts "#{username} haven't been active on GitHub today. (last activity #{last_date})"
puts "Emailing them..."
cmd = "sendmail #{email_address} < #{email_template}"
output = exec(cmd)
puts output
else
puts "#{username} have been active on GitHub today! (#{last_date})"
end
