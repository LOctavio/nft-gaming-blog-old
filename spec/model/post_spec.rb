require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'New post', text: 'this is a new post', comments_counter: 0, likes_counter: 0, author_id: 1)
  end

  before do
    User.create(id: 1, name: 'Luis', photo: 'photo-url', bio: 'bio', post_counter: 0)
    subject.save
  end

  it 'Title must not be blank' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters.' do
    subject.title = 'title'
    expect(subject).to be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end
end
