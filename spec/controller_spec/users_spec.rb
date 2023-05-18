require 'rails_helper'

RSpec.describe 'Users', type: :request do

  describe 'GET /users/index' do
    it 'checks if request is successful' do
      get '/users/index'
      expect(response).to be_successful
    end

    it 'checks if correct template is rendered' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'checks if response body is correct' do
      get users_path
      expect(response.body).to include('Router for all users')
    end
  end

  describe 'GET "/users/#{user.id}" to fetch specific users' do
    user = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)

    it 'should return successful when a user is created' do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end

    it 'should return response body' do
      get users_path
      expect(response.body).to include('<h1>Router for all users</h1>')
    end

    it 'should render template for user' do
      get "/users/show"
      expect(response).to render_template('show')
    end

  end
end