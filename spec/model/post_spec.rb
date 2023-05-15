require 'rails_helper'

RSpec.describe Post, type: model do
  user = User.new(name: 'John',
                  photo: 'www.eample.com',
                  bio: 'Life science',
                  posts_counter: 0)

  post = Post.new(title: 'Journey', text: 'subject', author: user, comments_counter: 0, likes_counter: 0)

  it 'is valid with correct attributes' do
    expect(post).to be_valid
  end

  it 'is valid with correct attributes' do
    post.title = nil
    expect(post).to be_valid
  end

  it 'is invalid with title less than 250' do
    expect(post).to be_valid
  end

  it 'is invalid with negative comment counter' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'is invalid with negative likes counter' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  describe 'five most recent posts' do
    let(:user) { User.new(name: 'shaibu') }
    let(:postone) { Post.new(author: user, text: 'hello', title: 'journey') }
    let!(:comment1) { Comment.new(post: postone, author: user, text: 'hello') }
    let!(:comment2) { Comment.new(post: postone, author: user, text: 'hello') }
    let!(:comment3) { Comment.new(post: postone, author: user, text: 'hello') }
    let!(:comment4) { Comment.new(post: postone, author: user, text: 'hello') }
    let!(:comment5) { Comment.new(post: postone, author: user, text: 'hello') }
    let!(:comment6) { Comment.new(post: postone, author: user, text: 'hello') }

    before do
      post.comments = [comment1, comment2, comment3, comment4, comment5]
      post.save
    end

    it 'returns the five most recent comments' do
      expect(post.five_recent_post).to eq([comment5, comment4, comment3, comment2, comment1])
    end

    it 'should update user posts_counter' do
      expect(user.posts_counter).to eq(2)
    end
  end
end
