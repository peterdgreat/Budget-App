require 'rails_helper'

RSpec.describe GroupSpending, type: :model do
  context 'Testing validations on a single subject' do
    before(:all) do
      @user = User.new(name: 'John Smith', password: '123456', email: 'abc@gmail.com')
      @group = Group.new(name: 'Group 1', user: @user)
      @spending = Spending.new(name: 'Spending 1', amount: 10, user: @user)
    end

    subject do
      GroupSpending.new(group: @group, spending: @spending)
    end
    before { subject.save }
    after(:all) do
      @user.destroy
    end
    it 'group must not be blank' do
      subject.group = nil
      expect(subject).to_not be_valid
    end
    it 'spending must not be blank' do
      subject.spending = nil
      expect(subject).to_not be_valid
    end
  end
end
