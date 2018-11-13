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

20.times do |i|
  User.create(email: "x#{i+1}@x.com", available: (i+1) * 1000000, password: "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}")
  # Order.create(user_id: i, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
  # Stock.create(current_price: i, max_price: i, min_price: i, start_price: i, end_price: i, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
end

10.times do |i|
  Buy.create(price: 100-(i+1), amount: 100, user_id: i, issue_id: 1)
  Sell.create(price: 100+(i+1), amount: 100, user_id: i+10, issue_id: 1)
end
