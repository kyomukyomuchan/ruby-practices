#!/usr/bin/env ruby

require 'optparse'
require 'date'

opts = OptionParser.new 

today = Date.today
genzai_month = Date.today.month
genzai_year = Date.today.year
params = ARGV.getopts("", "m:#{genzai_month}", "y:#{genzai_year}")

month = params["m"].to_i
year = params["y"].to_i

begining_day = Date.new(year,month,1)
last_day = Date.new(year,month,-1)
 
if year.to_i >= 1970 && year.to_i <= 2100
  month_year = [month.to_s + "月" + year.to_s]
  month_year_s = month_year.join("")
  result = month_year_s.center(20)
  puts result

  wdays = ["日","月","火","水","木","金","土"] 
  puts wdays.join(" ")

  carender = (begining_day..last_day).map do |hiniti|
    if hiniti == begining_day
      spece = begining_day.wday * 3 
    else 
      spece = 0 
    end
   
    day = " " * spece + hiniti.day.to_s.rjust(2)
   
    if hiniti.wday == 6 
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
  end
  puts result.join(' ')  
else 
  puts "範囲外です" 
end