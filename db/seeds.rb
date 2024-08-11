# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ingredient_list = List.create!(name: 'Ingredients')
packaging_list = List.create!(name: 'Packaging Supplies')
cleaning_list = List.create!(name: 'Cleaning Supplies')

baker_cheese = Item.create!(name: "Baker's Cheese", minimum: 1, number_in_stock: 0, item_type: 0, list_id: ingredient_list.id)
donut_raise = Item.create!(name: "50# Grade A Donut Raise", minumum: 8, number_in_stock: 2, item_type: 0, list_id: ingredient_list.id)
cake_board = Item.create!(name: '1/2 Sheet DW Cake Board', minimum: 2, number_in_stock: 1, item_type: 1, list_id: packaging_list.id)
paper_towel = Item.create!(name: "Box of 36 Count Paper Towels", minimum: 4, number_in_stock: 0, item_type: 2, list_id: cleaning_list.id)