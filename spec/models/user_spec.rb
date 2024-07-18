require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# This is a comment to show branch adding

describe User do
  it 'should have a name' do
    expect(User.create(username: 'Drew')).to be_valid
  end

  it 'should have an email' do
    expect(User.create(email: 'drew@test.com')).to be_valid
  end
end
