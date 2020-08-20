require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user){ User.create(first_name: 'wales', last_name: 'adeks', username: 'abc123') }

  subject { described_class.new({ creator_id: user.id, title: 'Hello', description: 'party 1', location: 'lagos', event_date: '2020-09-22' })}

  it "should create an event with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without creator_id attribute" do
    subject.creator_id = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:invitations).without_validating_presence }
    it { should have_many(:attendees).without_validating_presence }
    it { should belong_to(:creator).without_validating_presence }
  end
end