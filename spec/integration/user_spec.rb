# require 'rails_helper'

# RSpec.describe 'Users', type: :feature do
#   before(:each) do
#     @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life science',
#                         posts_counter: 0)
#     @postone = Post.create(title: 'something', text: 'hello', author: @user, comments_counter: 0, likes_counter: 0)
#     @posttwo = Post.create(title: 'cool', text: 'world', author: @user, comments_counter: 0, likes_counter: 0)
#     @postthree = Post.create(title: 'good', text: 'journey', author: @user, comments_counter: 0, likes_counter: 0)
#     @postfour = Post.create(title: 'amazing', text: 'space travel', author: @user, comments_counter: 0,
#                             likes_counter: 0)
#   end

#   describe 'Test for index page of users' do
#     it 'should test for correct content on the page' do
#       visit users_path
#       expect(page).to have_content(@user.name)
#     end

#     it 'should show profile picture for each user' do
#       visit users_path
#       expect(page).to have_css('img[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
#     end

#     it 'should show number of posts for each user' do
#       visit users_path
#       expect(page).to have_content(@user.posts_counter)
#     end

#     it 'should redirect when i click on user to shoe page' do
#       visit users_path
#       click_link @user.name
#       expect(page).to have_current_path(user_path(@user))
#     end
#     end

#     describe 'Test for show page for users' do
#       it 'should show users profile picture' do
#         visit user_path(@user.id)
#         expect(page).to have_css('img')
#       end

#       it 'should show the users username' do
#         visit user_path(@user.id)
#         expect(page).to have_content(@user.name)
#       end

#       it 'should show user number of posts' do
#         visit user_path(@user.id)
#         expect(page).to have_content(@user.posts_counter)
#       end

#       it 'should show the users bio' do
#         visit user_path(@user.id)
#         expect(page).to have_content(@user.bio)
#       end

#       it 'should show the users first three post' do
#         visit user_path(@user.id)
#         expect(page).to have_content(@user.three_recent_post.first.title)
#         expect(page).to have_content(@user.three_recent_post.second.title)
#         expect(page).to have_content(@user.three_recent_post.third.title)
#       end

#       it 'should button to view all users post' do
#         visit user_path(@user.id)
#         expect(page).to have_link('See all posts')
#       end

#       it 'should redirect to users show page when i click on user post' do
#         visit user_posts_path(@user)
#         click_link @postone.title
#         expect(current_path).to match(user_posts_path(@user.id))
#       end

#       it 'should redirect to user index page when user click see all post' do
#         visit user_path(@user.id)
#         click_link 'See all posts'
#         expect(current_path).to match(user_posts_path(@user.id))
#       end
#       end
#   end
