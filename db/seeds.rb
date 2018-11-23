# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/data_j.csv', headers: true) do |row|
  unless Issue.exists?(stock_number: row[0])
    Issue.create(:stock_number => row[0], :company_name => row[1])
  end
end

CSV.foreach('db/1301_2018.csv') do |row|
  Stock.create(:max_price => row[2], :min_price => row[3], :start_price => row[1], :end_price => row[4], :date => row[0], :stock_number => row[7])
end

CSV.foreach('db/1320_2018.csv') do |row|
  Stock.create(:max_price => row[2], :min_price => row[3], :start_price => row[1], :end_price => row[4], :date => row[0], :stock_number => row[7])
end

10.times do |i|
  User.create(email: "x#{i+1}@x.com", available: (i+1) * 1000000, password: "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}")
  User.create(email: "y#{i+1}@y.com", available: (i+1) * 1000000, password: "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}")
  Buy.create(price: 3010-(i+1), amount: 100, user_id: 2*i+1, issue_id: 1)
  Sell.create(price: 3010+(i+1), amount: 100, user_id: 2*i+2, issue_id: 1)
  Buy.create(price: 22220-(10*i+10), amount: 100, user_id: 2*i+1, issue_id: 11)
  Sell.create(price: 22220+(10*i+10), amount: 100, user_id: 2*i+2, issue_id: 11)
end

Stock.create(max_price: 3100, min_price: 2980, start_price: 3090, end_price: 3050, date: Date.today - 1, stock_number: 1301)
Stock.create(max_price: 3010, min_price: 3010, start_price: 3010, end_price: 3010, date: Date.today, stock_number: 1301)

Stock.create(max_price: 22220, min_price: 22220, start_price: 22220, end_price: 22220, date: Date.today - 1, stock_number: 1320)
Stock.create(max_price: 22220, min_price: 22220, start_price: 22220, end_price: 22220, date: Date.today, stock_number: 1320)
