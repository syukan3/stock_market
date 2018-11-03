# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/data_j.csv') do |row|
  Issue.create(:stock_number => row[0], :company_name => row[1])
end

5.times do |i|
  User.create(email: "x#{i+1}@x.com", available: (i+1) * 1000000, password: "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}" + "#{i+1}")
  # Order.create(user_id: i, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
  # Order.create(user_id: i+1, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
  # Order.create(user_id: i+2, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
  # Order.create(user_id: i+3, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
  # Order.create(user_id: i+4, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
  Stock.create(current_price: i, max_price: i, min_price: i, start_price: i, end_price: i, stock_number: "#{i}" + "#{i+1}" + "#{i+2}" + "#{i+3}")
end
