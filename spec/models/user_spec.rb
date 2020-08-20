require 'rails_helper'

RSpec.describe User, type: :model do
  describe "a specification" do
    
    subject { described_class.new({ first_name: 'wales', last_name: 'adeks', username: 'wale2'} )}
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  
    it "is not valid without username attribute" do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end
  
  describe "Associations" do
    it { should have_many(:events).without_validating_presence }
    it { should have_many(:attendees).without_validating_presence }
    it { should have_many(:occasions).without_validating_presence }
  end
end