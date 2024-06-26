require "rails_helper"

describe "Lists API" do
  it "sends a group of lists" do
    list1 = List.create!({ name: "Ingredients" })
    list2 = List.create!({ name: "Paper" })

    get "/api/v1/lists"

    expect(response).to be_successful

    lists = JSON.parse(response.body, symbolize_names: true)

    expect(lists[:data].count).to eq(2)

    lists[:data].each do |list|
      expect(list).to have_key(:id)

      expect(list[:attributes]).to have_key(:name)
      expect(list[:attributes][:name]).to be_a String
    end
  end

  it "can get one list by its id" do
    list1 = List.create!({ name: "Ingredients" })

    get "/api/v1/lists/#{list1.id}"

    list = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(list[:data]).to have_key(:id)

    expect(list[:data][:attributes]).to have_key(:name)
    expect(list[:data][:attributes][:name]).to eq("Ingredients")
  end

  it "can create a new list" do
    list_params = ({ name: "Ingredients" })

    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/lists", headers: headers, params: JSON.generate(list: list_params)
    created_list = List.last

    expect(response).to be_successful
    expect(created_list.name).to eq(list_params[:name])
  end

  it "can update an existing list" do
    list1 = List.create!({ name: "Ingredients" })
    list_params = { name: "Food Product" }
    headers = { "CONTENT_TYPE" => "application/json" }

    patch "/api/v1/lists/#{list1.id}", headers: headers, params: JSON.generate({ list: list_params })

    list = List.find_by(id: list1.id)

    expect(response).to be_successful
    expect(list.name).to_not eq("Ingredients")
    expect(list.name).to eq("Food Product")
  end

  it "can destroy a list" do
    list1 = List.create!({ name: "Ingredients" })

    expect(List.count).to eq(1)

    delete "/api/v1/lists/#{list1.id}"

    expect(response).to be_successful
    expect(List.count).to eq(0)
    expect { List.find(list1.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
