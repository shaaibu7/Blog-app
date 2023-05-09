# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

bin/rails generate migration CreateUsers name:string photo:string bio:string 

bin/rails generate migration CreateComments text:text author:references posts:references

bin/rails generate migration CreatePosts title:string text:text author:references

bin/rails generate migration CreateLikes author:references posts:references

bin/rails generate migration AddNumberOfPostsToUsers posts_counter:integer

bin/rails generate migration AddNumberOfCommentsToPost comments_counter:integer

bin/rails generate migration AddNumberOfLikesToPost likes_counter:integer

