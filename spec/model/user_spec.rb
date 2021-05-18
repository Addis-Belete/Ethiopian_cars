require 'rails_helper'
RSpec.describe User, type: :model do
  context 'Associations' do
    it 'has_many vehicles' do
      association = described_class.reflect_on_association(:vehicles)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end
  let(:user) do
    User.create(id: 1, first_name: 'Addis', last_name: 'Belete', email: 'Addis.bel@gmail.com', password: 1234)
  end
  context 'Should create User successfully' do
    it 'should return user_id 1' do
      expect(user.id).to eq(1)
    end
    it 'should not return user_id 2' do
      expect(user.id).not_to eq(2)
    end
    it 'should return first_name Addis' do
      expect(user.first_name).to eq('Addis')
    end
    it "should not return first_name ''" do
      expect(user.first_name).not_to eq('')
    end
    it 'should return last_name Belete' do
      expect(user.last_name).to eq('Belete')
    end
    it "should not return last_name '' " do
      expect(user.last_name).not_to eq('')
    end
    it 'should return email addis.bel@gmail.com' do
      expect(user.email).to eq('addis.bel@gmail.com')
    end
    it "should not return email ''" do
      expect(user.email).not_to eq('')
    end
  end
end
