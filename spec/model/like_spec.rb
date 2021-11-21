require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Like.new(author_id: 1, post_id: 1)
  end

  before do
    User.create(id: 1, name: 'Luis', photo: 'photo-url', bio: 'bio', post_counter: 0)
    Post.create(id: 1, title: 'New post', text: 'this is a new post', comments_counter: 0, likes_counter: 0, author_id: 1)
    subject.save
  end

  context 'update_likes_counter' do
    it 'Must increment likes_counter by 1' do
      expect(subject.post.likes_counter).to be(1)
    end
  end
end