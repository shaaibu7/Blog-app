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
    expect(user).to be_valid
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

  it 'should return three recent post' do
    user1 = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)
    user1.save
    @post1 = user1.posts.create!(title: 'something', text: 'hello', comments_counter: 0, likes_counter: 0)
    @post2 = user1.posts.create!(title: 'some nice', text: 'hello', comments_counter: 0, likes_counter: 0)
    @post3 = user1.posts.create!(title: 'some new', text: 'hello', comments_counter: 0, likes_counter: 0)
    @post4 = user1.posts.create!(title: 'some hard', text: 'hello', comments_counter: 0, likes_counter: 0)

    expect(user1.three_recent_post).to eq([@post4, @post3, @post2])
  end
end
