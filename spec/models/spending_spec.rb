require 'rails_helper'

RSpec.describe Spending, type: :model do
  context 'Testing validations on a single subject' do
    before(:all) do
      @user = User.new(name: 'John Smith', password: '123456', email: ' abc@gmail.com')
    end
    subject do
      Spending.new(name: 'Spending 1', amount: 10, user: @user)
    end
    after(:all) do
      @user.destroy
    end
    it 'is valid with the inserted valid attributes' do
      expect(subject).to be_valid
    end
    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'value must not be blank' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end
end
