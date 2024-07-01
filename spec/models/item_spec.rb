require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:minimum) }
    it { should validate_presence_of(:number_in_stock) }
    it { should validate_presence_of(:item_type)}
  end
end