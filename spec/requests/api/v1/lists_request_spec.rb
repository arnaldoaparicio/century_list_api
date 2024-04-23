require 'rails_helper'

describe 'Lists API' do
    it 'sends a group of lists' do
        list1 = List.create!({name: 'Ingredients'})
        list2 = List.create!({name: 'Paper'})

        get '/api/v1/lists'

        expect(response).to be_successful

        lists = JSON.parse(response.body, symbolize_names: true)

        expect(lists.count).to eq(2)

        lists.each do |list|
            expect(list).to have_key(:id)
            expect(list[:id]).to be_an Integer

            expect(list).to have_key(:name)
            expect(list[:name]).to be_a String
        end
    end
end