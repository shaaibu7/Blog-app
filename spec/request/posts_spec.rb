require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)
  post = Post.create(title: 'something', text: 'hello', author: user, comments_counter: 0, likes_counter: 0)

  describe "GET /users/#{user.id}/posts/#{post.id}" do
    it 'should return a successful request' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to be_successful
    end

    it 'should render correct template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('show')
    end

    it 'should check if response body is correct' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include(post.title)
    end
  end

  describe 'GET /users/:id' do
    it 'should return a successful response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to be_successful
    end

    it 'should check if response body is correct' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include(post.title)
    end

    it 'should return template for response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('show')
    end
  end
end
