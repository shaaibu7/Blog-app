require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    user = User.create(name: 'Tom', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)

    it 'checks if request is successful' do
      get '/users'
      expect(response).to be_successful
    end

    it 'checks if correct template is rendered' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'checks if response has correct data' do
      get '/users/'
      expect(response.body).to include(user.name)
    end
  end

  describe 'GET to fetch specific users' do
    user = User.create(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)

    it 'should return successful when a user is created' do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end

    it 'should return response body' do
      get "/users/#{user.id}"
      expect(response.body).to include(user.name)
    end

    it 'should render template for user' do
      get "/users/#{user.id}"
      expect(response).to render_template('show')
    end
  end
end
