require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Luis', photo: 'photo-url', bio: 'bio', post_counter: 0) }

  before do
    subject.save
    subject.posts.create(id: 1, title: 'New post', text: 'this is a new post', comments_counter: 0, likes_counter: 0)
    subject.posts.create(id: 2, title: 'New post', text: 'this is a new post', comments_counter: 0, likes_counter: 0)
    subject.posts.create(id: 3, title: 'New post', text: 'this is a new post', comments_counter: 0, likes_counter: 0)
    subject.posts.create(id: 4, title: 'New post', text: 'this is a new post', comments_counter: 0, likes_counter: 0)
  end

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

  context 'most_recent_posts method' do
    it 'Must return 3 posts' do
      expect(subject.most_recent_posts.length).to be(3)
    end
  end
end
