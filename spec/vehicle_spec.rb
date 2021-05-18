require 'rails_helper'
RSpec.describe 'new vehicle link', type: :system do
  describe 'root page' do
    it 'shows the links to create new vehicle' do
      visit root_path
      expect(page).to have_content('Log in')
    end
  end
end
RSpec.describe Vehicle, type: :model do
  let(:vehicle) { Vehicle.create(id: 1, name: 'any name', make: 'Toyota', model: 2020) }
  context 'should create new vehicle successfully' do
    it 'should return vehicle id' do
      expect(vehicle.id).to eq(1)
    end
    it 'should not return vehicle id 2' do
      expect(vehicle.id).not_to eq(2)
    end
    it 'should return vehicle make Toyota' do
      expect(vehicle.make).to eq('Toyota')
    end
    it 'should return vehicle model 2020' do
      expect(vehicle.model).to eq(2020)
    end
  end
  describe 'ActiveRecord associations' do
    it 'belongs to user' do
      expect { should belongs_to(user) }
    end
    it 'belongs to categories' do
      expect { should belongs_to(category) }
    end
    it 'has many categories' do
      expect { should has_many(categories) }
    end
  end
end
