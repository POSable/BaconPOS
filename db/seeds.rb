# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  Pos.create!(company_id: 1, name: "First Register", description: "Serial Number 545")


  Item.create!(name: "Bacon", description: "So Good!", price: 4.99)
  Item.create!(name: "Bacon", description: "So Good!", price: 4.99)
  Item.create!(name: "Cheddar", description: "So Good!", price: 8.99)
  Item.create!(name: "Salami", description: "So Good!", price: 6.99)
  Item.create!(name: "Provolone", description: "So Good!", price: 6.49)
  Item.create!(name: "Asparagus", description: "So Good!", price: 5.50)
  Item.create!(name: "Broccoli", description: "So Good!", price: 4.99)
  Item.create!(name: "Salmon", description: "So Good!", price: 9.99)
  Item.create!(name: "Apples", description: "So Good!", price: 2.99)

  Customer.create!(
    name: "David",
    phone: "101-505-5555",
    email: "david@email",
    address: "1000 1st St Denver CO 2000",
    cc_type: "Visa",
    cc_last4: 1234,
    cc_auth: "1A1A"
  )

  Customer.create!(
    name: "Nick",
    phone: "101-515-5555",
    email: "nick@email",
    address: "1001 1st St Denver CO 2000",
    cc_type: "MasterCard",
    cc_last4: 5678,
    cc_auth: "2B2B"
  )
