# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


supplier = Supplier.create!(name: "target")

product = Product.new(name: "comb", price: 5, description: "fixes your hair", supplier_id: supplier.id)
product.save!