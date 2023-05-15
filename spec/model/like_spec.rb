require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)

  post = Post.new(title: 'something', text: 'hello', author: user, comments_counter: 0, likes_counter: 0)

  subject do
    described_class.new(author: user, post: post)
  end

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

  it 'should update like counter' do
    expect(post.likes_counter).to eq 1
  end
end
