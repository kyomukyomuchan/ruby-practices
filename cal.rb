#!/usr/bin/env ruby

require 'optparse'
require 'date'

today = Date.today
current_month = today.month
current_year = today.year
opts = ARGV.getopts("", "m:#{current_month}", "y:#{current_year}")

month = opts["m"].to_i
year = opts["y"].to_i

begining_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)
 
if (1700..2100).cover?(year)
  puts "      #{month}月#{year}"
  puts ["日", "月", "火", "水", "木", "金", "土"].join(" ")

  spece = begining_date.wday * 3
  
  print " " * spece

  (begining_date..last_date).each do |date|
    if date.wday == 6
      puts date.day.to_s.rjust(2) 
    else
      print date.day.to_s.rjust(2) + " "
    end
  end 
else 
  puts "範囲外です" 
end
puts
