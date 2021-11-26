require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'New post', text: 'this is a new post', comments_counter: 0, likes_counter: 0, author_id: 1)
  end

  before do
    User.create(id: 1, name: 'Luis', photo: 'photo-url', bio: 'bio', post_counter: 0)
    subject.save
    subject.comments.create(id: 1, text: 'new comment', author_id: 1)
    subject.comments.create(id: 2, text: 'new comment', author_id: 1)
    subject.comments.create(id: 3, text: 'new comment', author_id: 1)
    subject.comments.create(id: 4, text: 'new comment', author_id: 1)
    subject.comments.create(id: 5, text: 'new comment', author_id: 1)
    subject.comments.create(id: 6, text: 'new comment', author_id: 1)
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

  context 'most_recent_comments method' do
    it 'Must return 3 posts' do
      expect(subject.most_recent_comments.length).to be(5)
    end
  end

  context 'update_posts_counter method' do
    it 'Must increment posts_counter by 1' do
      expect(subject.author.post_counter).to be(1)
    end
  end
end