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
  puts "      " + month.to_s + "月" + year.to_s
  wdays = ["日", "月", "火", "水", "木", "金", "土"] 
  puts wdays.join(" ")
  
  carender = (begining_date..last_date).map do |days|
    if days == begining_date
      spece = begining_date.wday * 3
    else 
      spece = 0 
    end
    
    day = " " * spece + days.day.to_s.rjust(2)
   
    if days.wday == 6 
      day + "\n"
    else 
      day 
    end
 end
 
  result = [] 
  week = [] 
 
  carender.each do |number|
    if number.include?("\n") 
      week << number 
      result << week 
      week = [] 
    else 
      week << number 
    end
  end 
    
  unless week.empty? 
    result << week
    result.each do |day_position|
      puts day_position.join(" ")
    end
  end
else 
  puts "範囲外です" 
end

