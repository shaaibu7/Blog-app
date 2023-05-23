require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:each) do
    @user = User.create(name: 'John', photo: 'www.example.com', bio: 'Life science', posts_counter: 0)
    @post = Post.create(title: 'something', text: 'hello', author: @user, comments_counter: 0, likes_counter: 0)
  end

  describe  'Test for index page of users' do
    it 'should test for correct content on the page' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    it 'should show profile picture for each user' do
      visit users_path
      expect(@user,photo).to have_css('img')
    end

    it 'should show number of posts for each user' do
      visit users_path
      expect(page).to have_content(@user.posts.count)
    end

    it 'should redirect when i click on user to shoe page' do
      visit users_path
      click_link @user.name
      expect(page).to have_current_path(@user.id)
    end
  end

  describe 'Test for show page for users' do
    it 'should show users profile picture' do
      visit user_path(@user.id)
    end


  end
end