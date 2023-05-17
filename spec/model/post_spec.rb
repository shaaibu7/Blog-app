require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)

  post = Post.new(title: 'something', text: 'hello', author: user, comments_counter: 0, likes_counter: 0)

  it 'is valid with correct attributes' do
    expect(post).to be_valid
  end

  it 'is not valid with correct attributes' do
    post.title = ''
    expect(post).to_not be_valid
  end

  it 'is valid with title less than 250' do
    post.title = 'hello'
    expect(post).to be_valid
  end

  it 'is invalid with title greater than 250' do
    post.title = 'hello' * 200
    expect(post).to_not be_valid
  end

  it 'is invalid with negative comment counter' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'is invalid with negative likes counter' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'should check five most recent post' do
    user = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)

    post2 = Post.new(title: 'something', text: 'hello', author: user, comments_counter: 0, likes_counter: 0)

    @comment1 = Comment.create!(text: 'hello world', author: user, post: post2)
    @comment2 = Comment.create!(text: 'hello world', author: user, post: post2)
    @comment3 = Comment.create!(text: 'hello world', author: user, post: post2)
    @comment4 = Comment.create!(text: 'hello world', author: user, post: post2)
    @comment5 = Comment.create!(text: 'hello world', author: user, post: post2)
    @comment6 = Comment.create!(text: 'hello world', author: user, post: post2)

    expect(post2.five_recent_post).to eq([@comment6, @comment5, @comment4, @comment3, @comment2])
  end
end
