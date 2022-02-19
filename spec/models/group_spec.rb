require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'Testing validations on a single subject' do
    before(:all) do
      @user = User.new(name: 'John Smith', password: '123456', email: 'abc@gmail.com')
    end
    subject do
      Group.new(name: 'Group 1', user: @user)
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
    it 'user must not be blank' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end
end
