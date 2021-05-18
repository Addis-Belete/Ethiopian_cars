require 'rails_helper'
RSpec.describe Category, type: :model do
  context 'Associations' do
    it 'has many vehicles' do
      association = described_class.reflect_on_association(:vehicles)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end
  let(:category) { Category.create(id: 1, name: 'CARS', priority: 'one') }
  context 'should create Category successfully' do
    it 'should return category_id  1' do
      expect(category.id).to eq(1)
    end
    it 'should not return category_id 2' do
      expect(category.id).not_to eq(2)
    end
    it 'should return category name CARS' do
      expect(category.name).to eq('CARS')
    end
    it 'should not return category name suv' do
      expect(category.name).not_to eq('suv')
    end
    it 'should return category priority one' do
      expect(category.priority).to eq('one')
    end
  end
end
