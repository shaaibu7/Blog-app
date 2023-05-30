require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life science',
                        posts_counter: 0)
    @postone = Post.create(title: 'something', text: 'hello', author: @user, comments_counter: 0, likes_counter: 0)
    @posttwo = Post.create(title: 'cool', text: 'world', author: @user, comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(text: 'hello world', author: @user, post: @postone)
    @comment2 = Comment.create(text: 'this is amazing', author: @user, post: @postone)
    @likeone = Like.new(author: @user, post: @postone)
    @liketwo = Like.new(author: @user, post: @posttwo)
  end

  describe 'Test for user post index page' do
    it 'should show user profile picture' do
      visit users_path
      expect(page).to have_css('img[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
    end

    it 'should show user username' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    it 'should show number of posts for user' do
      visit users_path
      expect(page).to have_content(@user.posts_counter)
    end

    it 'should show title of post' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.title)
    end

    it 'should show body of post' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.text)
    end

    it 'should show first comment on a post' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@comment1.text)
    end

    it 'should show many comments a post has' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.comments_counter)
    end

    it 'show how many likes a post has' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.likes_counter)
    end

    it 'show section for pagination if there are post than fit on the view' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('pagination')
    end

    it 'when i click on a post it should redirect me to post show page' do
      visit user_posts_path(@user.id)
      click_link @postone.title
      expect(current_path).to match(user_posts_path(@user.id))
    end
  end
end
