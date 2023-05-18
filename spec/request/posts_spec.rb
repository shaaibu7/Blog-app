require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/id/posts/index' do
    it 'should return a successful request' do
      get '/users/id/posts/index'
      expect(response).to be_successful
    end

    it 'should render correct template' do
      get '/users/id/posts'
      expect(response).to render_template('index')
    end

    it 'should check if response body is correct' do
      get '/users/id/posts'
      expect(response.body).to include('<h1>Route for list of post<h1>')
    end
  end

  describe 'GET /users/:id' do
    user = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)
    post = Post.new(title: 'something', text: 'hello', author: user, comments_counter: 0, likes_counter: 0)

    it 'should return a successful response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to be_successful
    end

    it 'should check if response body is correct' do
      get "/users/#{user.name}/posts/#{post.title}"
      expect(response.body).to include('<h1>Route for specific post id')
    end

    it 'should return template for response' do
      get "/users/#{user.name}/posts/#{post.title}"
      expect(response).to render_template('show')
    end
  end
end
