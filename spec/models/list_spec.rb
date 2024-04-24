require 'rails_helper'

RSpec.describe List, type: :model do
    describe 'validations' do
        it { should validat_presence_of(:name) }
    end
end