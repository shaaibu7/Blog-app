require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:each) do
    @user = User.create(name: 'Kaplan', photo: 'https://pic.com', bio: 'Life science',
                        posts_counter: 0)
    # @postone = Post.create(title: 'something', text: 'hello', author: @user, comments_counter: 0, likes_counter: 0)
    # @posttwo = Post.create(title: 'cool', text: 'world', author: @user, comments_counter: 0, likes_counter: 0)
    # @postthree = Post.create(title: 'good', text: 'journey', author: @user, comments_counter: 0, likes_counter: 0)
    # @postfour = Post.create(title: 'amazing', text: 'space travel', author: @user, comments_counter: 0,
    #                         likes_counter: 0)
  end

  describe 'Test for index page of users' do
    it 'should test for correct content on the page' do
      visit '/'
      expect(page).to have_content(@user.name)
    end

    it 'should show profile picture for each user' do
      visit users_path
      expect(page).to have_css('img[src="https://pic.com"]')
    end

    it 'should show number of posts for each user' do
      visit users_path
      expect(page).to have_content(@user.posts_counter)
    end

    it 'should redirect when i click on user to show page' do
      visit users_path
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
