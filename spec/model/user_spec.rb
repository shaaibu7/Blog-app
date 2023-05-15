require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(
      name: 'John',
      photo: 'www.eample.com',
      bio: 'Life science',
      posts_counter: 0
    )
  end

  it 'Should be a valid user with attributes' do
    expect(user).to_not be_valid
  end

  it 'should not be valid with a negative post counter' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'should not be valid with a string post counter' do
    user.posts_counter = 'hello'
    expect(user).to_not be_valid
  end

  it 'should not be valid with a nil value for name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  describe 'three_recent_post' do
    let(:user) { User.new(name: 'shaibu', posts_counter: 0) }
    let!(:post1) { Post.new(author: user, text: 'hello', title: 'world') }
    let!(:post2) { Post.new(author: user, text: 'hello', title: 'world') }
    let!(:post3) { Post.new(author: user, text: 'hello', title: 'world') }

    before do
      user.posts = [post1, post2, post3]
      user.save
    end
    it 'returns the three most recent posts' do
      expect(user.three_recent_post).to eq([post3, post2, post1])
    end
  end
end
