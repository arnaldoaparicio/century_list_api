require 'rails_helper'

describe 'Lists API' do
    it 'sends a group of lists' do
        list1 = List.new('Ingredients')
        list2 = List.new('Paper')

        get '/api/v1/lists'

        expect(response).to be_successful
    end
end