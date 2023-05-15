require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)

  post = Post.new(title: 'something', text: 'hello', author: user, comments_counter: 0, likes_counter: 0)

  subject(:comment) do
    Comment.new(text: 'hello world', author: user, post: post)
  end

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without correct attributes' do
    comment.text = nil
    expect(subject).to be_valid
  end

  it 'should update comment counter' do
    comment.save
    expect(comment.comments_counter).to eq(2)
  end
end
