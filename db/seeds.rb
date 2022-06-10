# frozen_string_literal: true

# We can make it faster by inserting data by bunches but I think it's not crucial in our case for now.

merchants = JSON.parse(File.read('./db/dataset/merchants.json'))
orders    = JSON.parse(File.read('./db/dataset/orders.json'))
shoppers  = JSON.parse(File.read('./db/dataset/shoppers.json'))

merchants['RECORDS'].each do |record|
  Merchant.create(record)
end

shoppers['RECORDS'].each do |record|
  Shopper.create(record)
end

orders['RECORDS'].each do |record|
  Order.create(record)
end
