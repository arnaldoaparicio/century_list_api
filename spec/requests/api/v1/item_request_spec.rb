require "rails_helper"

describe "Item API" do
  it "gets ingredient by its id number" do
    list1 = List.create!({ name: "Ingredients" })

    item1 = Item.create!({ name: "Baker's Cheese",
                           minimum: 4,
                           number_in_stock: 4,
                           item_type: 0,
                           list_id: "#{list1.id}" })
    
    get "/api/v1/lists/#{list1.id}/#{item1.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:data]).to have_key(:id)

    expect(item[:data]).to have_key(:attributes)
    
    expect(item[:data][:attributes]).to have_key(:name)
    expect(item[:data][:attributes][:name]).to eq("Baker's Cheese")

    expect(item[:data][:attributes]).to have_key(:minimum)
    expect(item[:data][:attributes][:minimum]).to eq(4)

    expect(item[:data][:attributes]).to have_key(:number_in_stock)
    expect(item[:data][:attributes][:number_in_stock]).to eq(4)

    expect(item[:data][:attributes]).to have_key(:item_type)
    expect(item[:data][:attributes][:item_type]).to eq('ingredient')
    
    
  end
end
