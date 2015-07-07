# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  Pos.create!(company_id: 1, name: "First Register", description: "Serial Number 545")

  Item.create!(name: "Pencil", description: "Number 2 Fine", price: 1.00)
  Item.create!(name: "Pen", description: "Black Very Fine", price: 2.00)
  Item.create!(name: "Pad", description: "White Lined 8.5x11", price: 5.25)


  Customer.create!(
    name: "David",
    phone: "101-505-5555",
    email: "david@email",
    address: "1000 1st St Denver CO 2000",
    cc_type: "Visa",
    cc_last4: 1234,
    cc_auth: "1A1A"
  )

  Invoice.create!(pos_id: 1, customer_id: 1, total: 20)

  Transaction.create!(invoice_id: 1, item_id: 1, qty: 20)
