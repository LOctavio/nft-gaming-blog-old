require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Luis', photo: 'photo-url', bio: 'bio', post_counter: 0) }

  before { subject.save }

  it 'Name must not be blank' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.post_counter = 0
    expect(subject).to be_valid
  end

  it 'PostsCounter must not be an integer smaller than zero.' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end
end
